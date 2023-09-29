import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/components/widgets/input.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/enums/imgs.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/size/index.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> _validateNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _nameValidateNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _passwordValidateNotifier =
      ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: SizedBox(
            height: context.mediaQuery.size.height,
            child: ValueListenableBuilder<bool>(
              valueListenable: _validateNotifier,
              builder: (context, isValid, __) {
                return Column(
                  children: [
                    (context.mediaQuery.size.height * .1).boxH,
                    ImgConstants.titleLogo.pngPicture(),
                    ImgConstants.dateLogo.pngPicture(),
                    Row(
                      children: [
                        ImgConstants.taxi.pngPicture(),
                      ],
                    ),
                    Expanded(
                      child: CustomPaint(
                        painter: _MenuBoxBackground(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mediaQuery.size.width * .15,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              ValueListenableBuilder<bool>(
                                valueListenable: _nameValidateNotifier,
                                builder: (context, valid, __) {
                                  'Name --> $valid'.log();
                                  return BoxInputField(
                                    controller: nameController,
                                    label: 'Имя пользователя:',
                                    placeholder: 'Имя',
                                    isError: !valid,
                                  );
                                },
                              ),
                              WidgetSizes.spacingM.boxH,
                              ValueListenableBuilder(
                                valueListenable: _passwordValidateNotifier,
                                builder: (context, valid, __) {
                                  'Pass --> $valid'.log();
                                  return BoxInputField(
                                    controller: passwordController,
                                    label: 'Парол:',
                                    password: true,
                                    placeholder: 'Парол',
                                    isError: !valid,
                                  );
                                },
                              ),
                              WidgetSizes.spacingM.boxH,
                              WidgetSizes.spacingM.boxH,
                              WidgetSizes.spacingM.boxH,
                              SizedBox(
                                width: double.infinity,
                                child: BoxButton(
                                  bgColor: kcButtonSuccessColor,
                                  disabled: !isValid,
                                  text: 'Подтверждение',
                                  onTap: () {
                                    if (nameController.text.trim().isEmpty) {
                                      _nameValidateNotifier.value = false;
                                      _validateNotifier.value = false;
                                    } else {
                                      _nameValidateNotifier.value = true;
                                    }
                                    if (passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      _passwordValidateNotifier.value = false;
                                      _validateNotifier.value = false;
                                    } else {
                                      _passwordValidateNotifier.value = true;
                                    }

                                    if (passwordController.text
                                            .trim()
                                            .isNotEmpty &&
                                        nameController.text.trim().isNotEmpty) {
                                      _validateNotifier.value = true;
                                    }

                                    if (isValid) {
                                      AppRouter.instance.goNamed(
                                        GoRouteNames.loginSuccess,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuBoxBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kcPrimaryColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    const triangleH = 10;
    const triangleW = 25;
    final width = size.width;
    final height = size.height;

    final trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..lineTo(width / 2 - triangleW / 2, height);
    canvas.drawPath(trianglePath, paint);
    const borderRadius = BorderRadius.only(topLeft: Radius.circular(100));
    final rect = Rect.fromLTRB(-10, -15, width, height);
    final outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
