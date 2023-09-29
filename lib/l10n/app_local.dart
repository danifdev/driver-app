import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_taxi/utils/assets.dart';

class JobAppLocalizations {
  JobAppLocalizations({this.locale});
  final Locale? locale;

  static JobAppLocalizations? of(BuildContext context) {
    return Localizations.of<JobAppLocalizations>(context, JobAppLocalizations);
  }

  static LocalizationsDelegate<JobAppLocalizations> delegate =
      _JobAppLocalDelegate();

  late Map<String, String> _localStrings;

  static const String _path = Assets.langPath;

  Future<void> loadJsonFile() async {
    final encodedString =
        await rootBundle.loadString('$_path${locale!.languageCode}.json');
    final jsonMap = jsonDecode(encodedString) as Map<String, dynamic>;

    _localStrings = jsonMap.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  String translate(String key) {
    return _localStrings[key] ?? '';
  }
}

class _JobAppLocalDelegate extends LocalizationsDelegate<JobAppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['tm', 'en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<JobAppLocalizations> load(Locale locale) async {
    final appLocal = JobAppLocalizations(locale: locale);
    await appLocal.loadJsonFile();
    return appLocal;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<JobAppLocalizations> old) {
    return false;
  }
}
