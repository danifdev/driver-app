import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_taxi/app/app_router.dart';
import 'package:ms_taxi/app/bloc/app_bloc.dart';
import 'package:ms_taxi/utils/theme/theme.dart';
// import 'package:ms_taxi/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc()..checkAndChangeTheme(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          log('Theme --> ${state.themeMode}');
          return MaterialApp.router(
            title: 'Ms Taxi',
            routerConfig: AppRouter.instance,
            theme: state.themeMode == AppThemeMode.light
                ? CustomTheme.light
                : CustomTheme.dark,
            // locale: AppLocales.all.first,
            // supportedLocales: AppLocales.all,
            themeMode: state.themeMode == AppThemeMode.light
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
