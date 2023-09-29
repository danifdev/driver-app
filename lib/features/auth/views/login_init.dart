import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/enums/imgs.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/paddings/paddings.dart';

class LoginInitView extends StatelessWidget {
  const LoginInitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            (context.mediaQuery.size.height * .1).boxH,
            SizedBox(
              height: 120,
              child: ImgConstants.msLogo.pngPicture(),
            ),
            ImgConstants.taxi.pngPicture(),
            (context.mediaQuery.size.height * .1).boxH,
            Padding(
              padding: const PagePadding.horizontalLowSymmetric(),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width) * .7,
                child: BoxButton(
                  text: 'Вход',
                  onTap: () {
                    AppRouter.instance.goNamed(GoRouteNames.login);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
