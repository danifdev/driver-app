import 'dart:developer' as dev;
import 'package:flutter/material.dart';

extension LoggerExtension on String {
  void log({StackTrace? stackTrace}) => dev.log(this, stackTrace: stackTrace);
}

extension SliverWidget on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }
}

extension LocaleNamed on Locale {
  bool get isTk => this == const Locale('en');
  bool get isRu => this == const Locale('ru');
}

extension LocaleName on String {
  bool get isTk => this == 'tk';
  bool get isRu => this == 'ru';
}

extension Spacings on num {
  SizedBox get boxH => SizedBox(height: toDouble());
  SizedBox get boxW => SizedBox(width: toDouble());
}

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ColorizeWidget on Widget {
  Widget toColorized({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.amber,
      child: this,
    );
  }
}

extension MediaQueryContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension PreferredSizeExt on Widget {
  PreferredSize get toPreferredSize => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: this,
      );
}

extension AlignmentExt on Widget {
  Widget toLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget toCenter() {
    return Align(
      child: this,
    );
  }

  Widget toRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }
}
