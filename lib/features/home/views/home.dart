import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/features/home/views/request/request.dart';
import 'package:ms_taxi/features/journey/views/journey.dart';
import 'package:ms_taxi/features/statistics/views/statistics.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/enums/imgs.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

enum RequestType {
  night('Ночной'),
  day('Дневной'),
  vip('VIP'),
  sienna('Sienna'),
  payload('Груз'),
  order('Доставка');

  final String title;
  const RequestType(this.title);
}

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.requestType = RequestType.day});

  final RequestType requestType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.mediaQuery.padding,
        child: SingleChildScrollView(
          child: Container(
            height: context.mediaQuery.size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            margin: const PagePadding.onlyTopLowNormal(),
            padding: const PagePadding.horizontalHighSymmetric(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImgConstants.smallCarLogo.pngPicture(),
                    WidgetSizes.spacingS.boxW,
                    Padding(
                      padding: const PagePadding.onlyTop(),
                      child: ImgConstants.msLogo.pngPicture(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // ignore: inference_failure_on_instance_creation
                        BoxButton(
                          bgColor: context.theme.primaryColor,
                          isExpanded: true,
                          text: 'Поехали',
                          onTap: () {
                            AppRouter.instance
                                .pushReplacement(JourneyView.route);
                          },
                        ),
                        _getType(context),
                      ],
                    ),
                    WidgetSizes.spacingXl.boxH,
                    BoxButton(
                      bgColor: context.theme.primaryColor,
                      isExpanded: true,
                      text: 'Cтатистика',
                      onTap: () {
                        AppRouter.instance.pushNamed(StatisticsView.route);
                      },
                    ),
                    WidgetSizes.spacingXl.boxH,
                    BoxButton(
                      bgColor: context.theme.primaryColor,
                      isExpanded: true,
                      text: 'Запрос',
                      onTap: () {
                        AppRouter.instance.pushNamed(RequestView.route);
                      },
                    ),
                  ],
                ),
                BoxButton(
                  isExpanded: true,
                  text: 'Выйти',
                  bgColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _getType(BuildContext context) {
    return Positioned(
      top: -28,
      right: 5,
      child: () {
        switch (requestType) {
          case RequestType.day:
            return Row(
              children: [
                const Icon(Icons.wb_sunny),
                BoxText.bodyMed(
                  RequestType.day.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          case RequestType.night:
            return Row(
              children: [
                const Icon(Icons.dark_mode),
                BoxText.bodyMed(
                  RequestType.night.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          case RequestType.order:
            return Row(
              children: [
                BoxText.bodyMed(
                  RequestType.order.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          case RequestType.payload:
            return Row(
              children: [
                BoxText.bodyMed(
                  RequestType.payload.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          case RequestType.sienna:
            return Row(
              children: [
                BoxText.bodyMed(
                  RequestType.sienna.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          case RequestType.vip:
            return Row(
              children: [
                BoxText.bodyMed(
                  RequestType.vip.title,
                  color: context.theme.primaryColor,
                ),
              ],
            );
          // ignore: no_default_cases
          default:
            return const SizedBox.shrink();
        }
      }(),
    );
  }
}
