import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Stream<double> get distanceStream => _distanceStreamController.stream;
  Stream<double> get moneyStream => _moneyStreamController.stream;

  Position? _lastPosition;

  Future<void> _init() async {
    await Permission.location.request();

    if (await Permission.location.isDenied) {
      await Geolocator.requestPermission();
      // throw Exception('Location permission denied');
    }

    if (await Permission.location.serviceStatus.isEnabled) {
      _listenToLocationUpdates();
    } else {
      throw Exception('Location service is disabled');
    }
  }

  void _listenToLocationUpdates() {
    const locationOptions =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);

    Geolocator.getPositionStream(locationSettings: locationOptions)
        .listen((position) {
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

        final money = distanceInKilometers * 7;

        _moneyStreamController.add(money);
      }

      _lastPosition = position;
    });
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
  }
}
