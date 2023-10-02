import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/base_app_bar.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/features/home/views/home.dart';
import 'package:ms_taxi/features/journey/views/journey_detail.dart';
import 'package:ms_taxi/features/journey/widgets/counter_money.dart';
import 'package:ms_taxi/features/journey/widgets/row_tile.dart';
import 'package:ms_taxi/features/journey/widgets/tarif_btn.dart';
import 'package:ms_taxi/services/location_service.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class JourneyView extends StatefulWidget {
  const JourneyView({this.type = RequestType.day, super.key});

  static const route = '/journey';

  final RequestType type;

  @override
  State<JourneyView> createState() => _JourneyViewState();
}

class _JourneyViewState extends State<JourneyView> {
  late LocationService _locationService;

  late StreamSubscription<int> _timerSubscription;
  final StreamController<String> _duration =
      StreamController<String>.broadcast();

  void startTimer() {
    var counter = 0;
    _timerSubscription =
        Stream<int>.periodic(const Duration(seconds: 1), (x) => counter++)
            .listen((counter) {
      final hoursStr =
          ((counter / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
      final minutesStr =
          ((counter / 60) % 60).floor().toString().padLeft(2, '0');
      final secondsStr = (counter % 60).toString().padLeft(2, '0');
      _duration.add('$hoursStr:$minutesStr:$secondsStr');
    });
  }

  void stopTimer() {
    _timerSubscription.cancel();
  }

  @override
  void initState() {
    startTimer();
    _locationService = LocationService();
    super.initState();
  }

  @override
  void dispose() {
    stopTimer();
    _locationService.dispose();
    // _locationService.
    super.dispose();
  }

  final ValueNotifier<Tariffs> _selectedTariff =
      ValueNotifier<Tariffs>(Tariffs.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const PagePadding.onlyTopLowNormal(),
        padding: const PagePadding.horizontalNormalSymmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetSizes.spacingXl.boxH,
              WidgetSizes.spacingXl.boxH,
              _tariffs(),
              WidgetSizes.spacingM.boxH,
              StreamBuilder<double>(
                stream: _locationService.moneyStream,
                builder: (context, snapshot) {
                  final money = snapshot.data ?? 0.0;
                  return CounterMoney(
                    money: money,
                  );
                },
              ),
              WidgetSizes.spacingM.boxH,
              _mainFunctions(),
              WidgetSizes.spacingXs.boxH,
              _divider(context),
              WidgetSizes.spacingXs.boxH,
              _status(),
              WidgetSizes.spacingXs.boxH,
              const RowTile(title: 'Мин. стоимост:', value: '7 TMT').toLeft(),
              WidgetSizes.spacingM.boxH,
              const RowTile(title: 'Время ожидания:', value: '00:12:34')
                  .toLeft(),
              WidgetSizes.spacingM.boxH,
              const RowTile(title: 'Цена:', value: '7TMT/km').toLeft(),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                title: 'Цена ожидание:',
                value: '7 TMT/km минут\n(2 минут безплатно)',
              ).toLeft(),
              WidgetSizes.spacingM.boxH,
              const RowTile(title: 'Цена за город:', value: '9TMT/km').toLeft(),
              WidgetSizes.spacingXl.boxH,
              WidgetSizes.spacingXl.boxH,
              WidgetSizes.spacingXl.boxH,
              SizedBox(
                width: context.mediaQuery.size.width * .6,
                child: BoxButton(
                  text: 'Финиш',
                  onTap: () {
                    _showAcceptDialog(context);
                  },
                ),
              ),
              WidgetSizes.spacingXl.boxH,
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showAcceptDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: kcWhite,
          content: Container(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.error,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 38,
              vertical: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WidgetSizes.spacingXxl.boxH,
                BoxText.bodyMed(
                  'ЗАВЕРШИТ ПОЕЗДКУ?',
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.theme.colorScheme.onSecondary,
                    fontSize: 20,
                  ),
                ),
                WidgetSizes.spacingXl.boxH,
                WidgetSizes.spacingXl.boxH,
                BoxButton(
                  text: 'ЗАВЕРШИТЬ',
                  bgColor: kcButtonErrorColor,
                  isExpanded: true,
                  onTap: () {
                    AppRouter.instance
                        .pushReplacementNamed(JourneyDetail.route);
                  },
                ),
                WidgetSizes.spacingXl.boxH,
                BoxButton(
                  isExpanded: true,
                  text: 'ПРОДОЛЖИТЬ',
                  bgColor: kcButtonSuccessColor,
                  onTap: AppRouter.instance.pop,
                ),
                WidgetSizes.spacingXxl.boxH,
              ],
            ),
          ),
        );
      },
    );
  }

  Row _status() {
    return Row(
      children: [
        Expanded(child: RowTile(title: 'Тариф:', value: widget.type.title)),
        BoxButton(
          text: 'Ожидания',
          padding: const PagePadding.allVeryLow(),
        ),
      ],
    );
  }

  Divider _divider(BuildContext context) {
    return Divider(
      color: context.theme.primaryColor,
      thickness: WidgetSizes.spacingXSS,
    );
  }

  Widget _mainFunctions() {
    return Row(
      children: [
        Expanded(
          child: StreamBuilder<String>(
            stream: _duration.stream,
            builder: (context, snapshot) {
              final t = snapshot.data;
              'Timer --> $t'.log();
              return RowTile(title: 'Время:', value: t ?? '00:00:00');
            },
          ),
        ),
        StreamBuilder<double>(
          stream: _locationService.distanceStream,
          builder: (context, snapshot) {
            final data = snapshot.data?.toStringAsFixed(1);
            'Distance --> ${snapshot.data}'.log();
            return Expanded(
              child: RowTile(
                title: 'Путь:',
                value: '${data ?? 0.0} км',
                needExpand: true,
              ),
            );
          },
        ),
      ],
    );
  }

  ValueListenableBuilder<Tariffs> _tariffs() {
    return ValueListenableBuilder<Tariffs>(
      valueListenable: _selectedTariff,
      builder: (context, tariff, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Tariffs.values
              .map(
                (e) => TariffBtn(
                  onChanged: (v) {
                    _selectedTariff.value = e;
                  },
                  data: e,
                  isSelected: tariff == e,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
