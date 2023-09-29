import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/app/bloc/app_bloc.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/enums/imgs.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/size/index.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // context.read<AppBloc>().checkAndChangeTheme();
    Future.delayed(const Duration(seconds: 2), () {
      AppRouter.instance.goNamed(GoRouteNames.loginInit);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.mediaQuery.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            WidgetSizes.spacingL.boxH,
            ImgConstants.carLogo.pngPicture(),
            WidgetSizes.spacingS.boxH,
            SizedBox(
              height: 120,
              child: ImgConstants.msLogo.pngPicture(),
            ),
            const Spacer(),
            Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            ),
            WidgetSizes.spacingXxl.boxH,
            WidgetSizes.spacingXxl.boxH,
          ],
        ),
      ),
    );
  }
}
