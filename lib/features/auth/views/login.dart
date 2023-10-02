import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/app/bloc/app_bloc.dart';
import 'package:ms_taxi/components/widgets/button.dart';
import 'package:ms_taxi/components/widgets/input.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/routes.dart';
import 'package:ms_taxi/utils/enums/imgs.dart';
import 'package:ms_taxi/utils/extensions.dart';
import 'package:ms_taxi/utils/size/index.dart';
import 'package:ms_taxi/utils/theme/theme.dart';

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
        child: SizedBox(
          // height: context.mediaQuery.size.height,
          child: Form(
            key: _key,
            child: ValueListenableBuilder<bool>(
              valueListenable: _validateNotifier,
              builder: (context, isValid, __) {
                return BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        (context.mediaQuery.size.height * .1).boxH,
                        if (state.themeMode == AppThemeMode.light) ...[
                          ImgConstants.titleLogo.pngPicture(),
                          ImgConstants.dateLogo.pngPicture(),
                        ] else ...[
                          ImgConstants.titleDark.pngPicture(),
                          ImgConstants.dateDark.pngPicture(),
                        ],
                        Row(
                          children: [
                            Expanded(child: ImgConstants.taxi.pngPicture()),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -40,
                              left: -30,
                              child: CustomPaint(
                                painter: RPSCustomPainter(
                                  context.theme.colorScheme.onSurface,
                                  width: context.mediaQuery.size.width + 50,
                                  // bg:,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.mediaQuery.size.width * .15,
                              ),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _nameValidateNotifier,
                                    builder: (context, valid, __) {
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
                                        if (nameController.text
                                            .trim()
                                            .isEmpty) {
                                          _nameValidateNotifier.value = false;
                                          _validateNotifier.value = false;
                                        } else {
                                          _nameValidateNotifier.value = true;
                                        }
                                        if (passwordController.text
                                            .trim()
                                            .isEmpty) {
                                          _passwordValidateNotifier.value =
                                              false;
                                          _validateNotifier.value = false;
                                        } else {
                                          _passwordValidateNotifier.value =
                                              true;
                                        }

                                        if (passwordController.text
                                                .trim()
                                                .isNotEmpty &&
                                            nameController.text
                                                .trim()
                                                .isNotEmpty) {
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
                                  WidgetSizes.spacingM.boxH,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class _MenuBoxBackground extends CustomPainter {
//   _MenuBoxBackground({required this.bg});

//   final Color? bg;
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = kcBlack
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2)
//       ..strokeWidth = 1
//       ..style = PaintingStyle.fill;
//     const triangleH = 10;
//     const triangleW = 25;
//     final width = size.width;
//     final height = size.height;

//     final shadowPaint = Paint()
//       ..color = kcBlack
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 15
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

//     final trianglePath = Path()
//       ..moveTo(width / 2 - triangleW / 2, height)
//       ..lineTo(width / 2, triangleH + height)
//       ..lineTo(width / 2 + triangleW / 2, height)
//       ..lineTo(width / 2 - triangleW / 2, height);
//     canvas.drawPath(trianglePath, paint);
//     // ..drawShadow(trianglePath, kcButtonErrorColor, 5, false);
//     const borderRadius = BorderRadius.only(topLeft: Radius.circular(100));
//     final rect = Rect.fromLTRB(5, -20, width, height);
//     final outer = borderRadius.toRRect(rect);
//     canvas.drawRRect(outer, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(390, 402),
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter(this.bg, {required this.width, super.repaint});

  final double width;
  final Color bg;
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(142.548, 22.4094);
    path_0.cubicTo(75, 30, 20, 70, 0, 90);
    path_0.lineTo(0, width);
    path_0.lineTo(width, width);
    path_0.lineTo(width, 10);
    path_0.cubicTo(width, 10.3753, 212.417, 14.9827, 142.548, 22.4094);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = bg;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
