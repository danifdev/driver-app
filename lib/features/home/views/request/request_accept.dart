import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/button.dart';
// import 'package:flutter/widgets.dart';
// import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/features/home/views/home.dart';
import 'package:ms_taxi/features/home/views/request/request.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
// import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class RequestAccept extends StatelessWidget {
  const RequestAccept({super.key, this.requestType});
  final RequestType? requestType;

  static const route = '/request-accept';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 162, 124),
      body: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 14),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: inference_failure_on_instance_creation
                  BoxButton(
                    text: 'Да',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 10),
                    bgColor: kcButtonSuccessColor,
                    onTap: () {
                      if (requestType != null) {
                        AppRouter.instance.pushReplacementNamed(
                          GoRouteNames.home,
                          extra: {'type': requestType},
                        );
                      }
                    },
                  ),
                  // ignore: inference_failure_on_instance_creation
                  BoxButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    bgColor: kcButtonErrorColor,
                    text: 'Нет',
                    onTap: () {
                      AppRouter.instance.pushReplacementNamed(
                        RequestView.route,
                      );
                    },
                  ),
                ],
              ),
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              BoxText.bodyMed(
                'Вы действительно хотите подтвердить?',
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kcSecondaryColor,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
            ],
          ),
        ),
      ),
    );
  }
}
