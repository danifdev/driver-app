import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:permission_handler/permission_handler.dart';

enum StatusDriver {
  waiting({
    'title': 'Ожидания',
    'color': kcButtonSuccessColor,
  }),
  driving({
    'title': 'Вождение',
    'color': kcPrimarySecondary,
  }),
  finished({
    'title': 'Завершенный',
    'color': kcButtonErrorColor,
  });

  final Map<String, dynamic> title;
  const StatusDriver(this.title);
}

final class LocationService {
  factory LocationService() => _instance;

  LocationService._internal() {
    _init();
  }
  static final LocationService _instance = LocationService._internal();

  final StreamController<Position> _positionStreamController =
      StreamController<Position>.broadcast();
  Stream<Position> get positionStream => _positionStreamController.stream;

  final StreamController<double> _distanceStreamController =
      StreamController<double>.broadcast();
  final StreamController<double> _moneyStreamController =
      StreamController<double>.broadcast();
  StreamSubscription<int>? _timerSubscription;
  final StreamController<String> _duration =
      StreamController<String>.broadcast();
  final StreamController<StatusDriver> _statusController =
      StreamController<StatusDriver>.broadcast();
  final StreamController<int> _waitingCost = StreamController<int>.broadcast();
  Stream<double> get distanceStream => _distanceStreamController.stream;
  Stream<double> get moneyStream => _moneyStreamController.stream;
  Stream<String> get durationStream => _duration.stream;
  Stream<StatusDriver> get statusDriver => _statusController.stream;

  StatusDriver _currentStatus = StatusDriver.waiting;
  bool waitingCostAdded = false;

  Position? _lastPosition;

  Future<void> _init() async {
    await Permission.location.request();
    await startTimer();

    debugPrint('-------------- Init ---------------');

    if (await Permission.location.isDenied) {
      debugPrint('-------------- Denied loc permission ---------------');
      await Geolocator.requestPermission();
      // throw Exception('Location permission denied');
    }

    if (await Permission.location.serviceStatus.isEnabled) {
      debugPrint('-------------- Enabled loc permission ---------------');
      await _listenToLocationUpdates();
    } else {
      await Geolocator.requestPermission();
      throw Exception('Location service is disabled');
    }
  }

  Future<void> _listenToLocationUpdates() async {
    const locationOptions =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);
    debugPrint(
      '-------------- Start listening to location updates ---------------',
    );

    Geolocator.getPositionStream(locationSettings: locationOptions)
        .listen((position) async {
      _positionStreamController.add(position);

      if (_lastPosition != null) {
        final distanceInMeters = Geolocator.distanceBetween(
          _lastPosition!.latitude,
          _lastPosition!.longitude,
          position.latitude,
          position.longitude,
        );

        final distanceInKilometers = distanceInMeters / 1000;

        _distanceStreamController.add(distanceInKilometers);

        var money = distanceInKilometers * 7;

        if (0.3 >= distanceInKilometers && distanceInKilometers >= 0.1) {
          if (_currentStatus == StatusDriver.waiting) {
            _currentStatus = StatusDriver.driving;
            _statusController.add(_currentStatus);
          }

          if (!waitingCostAdded) {
            _waitingCost.stream.listen((event) {
              if (event > 0 && !waitingCostAdded) {
                money += 7;
                waitingCostAdded = true;
              }
            });
          }
        }

        _moneyStreamController.add(money);
      }

      _lastPosition ??= position;
    });
  }

  Future<void> startTimer() async {
    var counter = 0;
    _timerSubscription =
        Stream<int>.periodic(const Duration(seconds: 1), (x) => counter++)
            .listen((counter) async {
      final hoursStr =
          ((counter / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
      final minutesStr =
          ((counter / 60) % 60).floor().toString().padLeft(2, '0');
      final secondsStr = (counter % 60).toString().padLeft(2, '0');
      _duration.add('$hoursStr:$minutesStr:$secondsStr');
      final cost = ((counter / 60) % 60).floor() / 2;

      _waitingCost.add(cost.toInt() >= 1 ? cost.toInt() : 0);
    });
  }

  void stopTimer() {
    _timerSubscription?.cancel();
  }

  Future<Position?> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }

  void dispose() {
    _positionStreamController.close();
    _distanceStreamController.close();
    _moneyStreamController.close();
    _statusController.close();
    _waitingCost.close();
    stopTimer();
  }
}
