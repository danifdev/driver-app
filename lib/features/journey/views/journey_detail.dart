import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/base_app_bar.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/features/journey/widgets/counter_money.dart';
import 'package:ms_taxi/features/journey/widgets/detail_money.dart';
import 'package:ms_taxi/features/journey/widgets/row_tile.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class JourneyDetail extends StatelessWidget {
  const JourneyDetail({super.key});

  static const route = '/journey-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Итого',
        canPop: false,
      ).toPreferredSize,
      body: Container(
        padding: const PagePadding.horizontalLowSymmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailMoney(money: 25.67),
              WidgetSizes.spacingXl.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Начальная стоимост :',
                value: '0.0ТМТ ',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Общее время:',
                value: '00:05:43',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Оплаченное время:',
                value: '00:05:43',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Общее расстоение:',
                value: '3.5км',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Оплаченное расстоение:',
                value: '3.5км',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Ожидание:',
                value: '00:02:38',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Расценки тарифа:',
                value: '7.0ТМТ/km',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Расценки загородом:',
                value: '9.0ТМТ/km',
              ),
              WidgetSizes.spacingM.boxH,
              const RowTile(
                valueAlignRight: true,
                title: 'Стоимост ожидания:',
                value: '5.0ТМТ/мин\n(Безплатно 2.0 мин)',
              ),
              WidgetSizes.spacingM.boxH,
              _additions(context),
              WidgetSizes.spacingXl.boxH,
              WidgetSizes.spacingXl.boxH,
              WidgetSizes.spacingXl.boxH,
              SizedBox(
                width: context.mediaQuery.size.width * .6,
                child: BoxButton(
                  text: 'OK',
                  onTap: () {
                    AppRouter.instance.goNamed(GoRouteNames.home);
                  },
                ),
              ).toCenter(),
              WidgetSizes.spacingXl.boxH,
            ],
          ),
        ),
      ),
    );
  }

  RowTile _additions(BuildContext context) {
    return RowTile(
      valueAlignRight: true,
      title: 'Дополнительные услуги:',
      value: '',
      valueW: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.add,
                  color: kcButtonSuccessColor,
                ),
                3.boxW,
                BoxText.caption(
                  'Животные',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            3.boxH,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.remove,
                  color: kcButtonErrorColor,
                ),
                3.boxW,
                BoxText.caption(
                  'Животные',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    color: context.theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
