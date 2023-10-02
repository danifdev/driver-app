import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/text.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';
import 'package:ms_taxi/utils/size/index.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      AppRouter.instance.goNamed(GoRouteNames.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.onBackground,
      body: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const PagePadding.generalAllNormal(),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              WidgetSizes.spacingL.boxH,
              Text(
                String.fromCharCode(0x2713),
                style: TextStyle(
                  inherit: false,
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  fontFamily: Icons.check.fontFamily,
                  color: context.theme.colorScheme.onSecondary,
                ),
              ),
              WidgetSizes.spacingL.boxH,
              BoxText.bigTitle(
                'Аккаунт создан',
                color: context.theme.colorScheme.onSecondary,
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
