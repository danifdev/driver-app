// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_taxi/utils/constants/colors.dart';
import 'package:ms_taxi/utils/theme/theme.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());

  void checkAndChangeTheme() {
    final hour = DateTime.now().hour;
    if (hour < 7 && hour > 4) {
      emit(state.copyWith(themeMode: AppThemeMode.dark));
      changeSystemTheme(isDark: true);
    } else {
      emit(state.copyWith(themeMode: AppThemeMode.light));
      changeSystemTheme();
    }
  }
}

class AppState {
  AppState({this.themeMode = AppThemeMode.light});

  final AppThemeMode themeMode;

  AppState copyWith({
    AppThemeMode? themeMode,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

void changeSystemTheme({bool isDark = false}) {
  Color navColor;

  navColor =  kcWhite;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: navColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
