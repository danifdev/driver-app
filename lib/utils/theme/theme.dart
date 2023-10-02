import 'package:flutter/material.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/constants/string_constants.dart';
import 'package:ms_taxi/utils/size/widget_size.dart';

enum AppThemeMode { light, dark }

class CustomTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    iconTheme: const IconThemeData(color: kcPrimaryColor),
    primaryColor: kcPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcSecondaryColor,
          width: WidgetSizes.spacingXSS,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcButtonErrorColor,
          width: WidgetSizes.spacingXSS,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: const ColorScheme(
      onSecondary: kcSecondaryColor,
      surface: kcWhite,
      onBackground: kcDialogBgView,
      onPrimary: kcWhite,
      primary: kcPrimaryColor,
      onSurface: kcPrimaryColor,
      secondary: kcWhite,
      error: kcWhite,
      brightness: Brightness.light,
      onError: kcWhite,
      background: kcWhite,
    ),
    fontFamily: StringConstants.fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    iconTheme: const IconThemeData(color: kcWhite),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcWhite,
          width: WidgetSizes.spacingXSS,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: kcButtonErrorColor,
          width: WidgetSizes.spacingXSS,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    primaryColor: kcWhite,
    colorScheme: const ColorScheme(
      onSecondary: kcWhite,
      surface: kcBlack,
      onBackground: kcDialogBgViewDark,
      onPrimary: kcSecondaryColor,
      primary: kcWhite,
      error: kcDialogBgViewDark,
      onSurface: kcShapeColor,
      brightness: Brightness.dark,
      secondary: kcSecondaryBg,
      onError: kcWhite,
      background: kcSecondaryBg,
    ),
    brightness: Brightness.dark,
    fontFamily: StringConstants.fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontFamily: StringConstants.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
