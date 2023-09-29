
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AppLocales {
  static const all = [
    Locale('ru, RU'),
    Locale('tm, TM'),
    Locale('en, US'),
  ];

  static String getFlags(String code) {
    switch (code) {
      case 'en':
        return '🇬🇧';
      case 'tm':
        return '🇹🇲';
      case 'ru':
      default:
        return '🇷🇺';
    }
  }
}
