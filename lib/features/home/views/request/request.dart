import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/base_app_bar.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/features/home/views/home.dart';
import 'package:ms_taxi/features/home/views/request/request_accept.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/widget_size.dart';

// ignore: must_be_immutable
class RequestView extends StatelessWidget {
  RequestView({super.key});
  static String route = '/request-view';

  ValueNotifier<RequestType?> selectedType = ValueNotifier<RequestType?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Запрос').toPreferredSize,
      body: Padding(
        padding: context.mediaQuery.padding,
        child: ValueListenableBuilder<RequestType?>(
          valueListenable: selectedType,
          builder: (context, type, __) {
            return Container(
              margin: const PagePadding.onlyTopLowNormal(),
              padding: const PagePadding.horizontalHighSymmetric(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      BoxButton<RequestType>.outlined(
                        isExpanded: true,
                        data: RequestType.vip,
                        onChanged: (value) {
                          selectedType.value = value;
                        },
                        text: RequestType.vip.title,
                        bgColor: context.theme.primaryColor,
                        isSelected: type == RequestType.vip,
                      ),
                      WidgetSizes.spacingXl.boxH,
                      BoxButton<RequestType>.outlined(
                        bgColor: context.theme.primaryColor,
                        data: RequestType.sienna,
                        onChanged: (value) {
                          selectedType.value = value;
                        },
                        isExpanded: true,
                        text: RequestType.sienna.title,
                        isSelected: type == RequestType.sienna,
                      ),
                      WidgetSizes.spacingXl.boxH,
                      BoxButton<RequestType>.outlined(
                        bgColor: context.theme.primaryColor,
                        isExpanded: true,
                        data: RequestType.payload,
                        onChanged: (value) {
                          selectedType.value = value;
                        },
                        text: RequestType.payload.title,
                        isSelected: type == RequestType.payload,
                      ),
                      WidgetSizes.spacingXl.boxH,
                      BoxButton<RequestType>.outlined(
                        bgColor: context.theme.primaryColor,
                        isExpanded: true,
                        data: RequestType.order,
                        onChanged: (value) {
                          selectedType.value = value;
                        },
                        text: RequestType.order.title,
                        isSelected: type == RequestType.order,
                      ),
                    ],
                  ),
                  // ignore: inference_failure_on_instance_creation
                  BoxButton(
                    isExpanded: true,
                    text: 'Выйти',
                    disabled: type == null,
                    isAccepted: true,
                    onTap: () {
                      if (type != null) {
                        AppRouter.instance.pushReplacementNamed(
                          RequestAccept.route,
                          extra: {'type': type},
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
