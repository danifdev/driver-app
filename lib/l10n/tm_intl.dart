import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;

const _tmDatePatterns = {
  'd': 'd',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  'LLLL': 'LLLL',
  'M': 'L',
  'Md': 'dd/MM',
  'MEd': 'EEE, dd/MM',
  'MMM': 'LLL',
  'MMMd': 'd MMM',
  'MMMEd': 'EEE, d MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd MMMM',
  'MMMMEEEEd': 'EEEE, d MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'MM/y',
  'yMd': 'dd/MM/y',
  'yMEd': 'EEE, dd/MM/y',
  'yMMM': 'MMM y',
  'yMMMd': 'd MMM y',
  'yMMMEd': 'EEE, d MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd MMMM y',
  'yMMMMEEEEd': 'EEEE, d MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

const _tmSymbols = {
  'NAME': 'tm',
  'ERAS': ['BC', 'AD'],
  'ERANAMES': ['Before Christ', 'Anno Domini'],
  'NARROWMONTHS': ['Ý', 'F', 'M', 'A', 'M', 'I', 'I', 'A', 'S', 'O', 'N', 'D'],
  'STANDALONENARROWMONTHS': [
    'Ý',
    'F',
    'M',
    'A',
    'M',
    'I',
    'I',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'MONTHS': [
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Sentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'STANDALONEMONTHS': [
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Sentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'SHORTMONTHS': [
    'Ýan',
    'Few',
    'Mar',
    'Apr',
    'Maý',
    'Iýu',
    'Iýl',
    'Awg',
    'Sen',
    'Okt',
    'Noý',
    'Dek',
  ],
  'STANDALONESHORTMONTHS': [
    'Ýan',
    'Few',
    'Mar',
    'Apr',
    'Maý',
    'Iýu',
    'Iýl',
    'Awg',
    'Sen',
    'Okt',
    'Noý',
    'Dek',
  ],
  'WEEKDAYS': [
    'Ýekşenbe',
    'Duşenbe',
    'Sişenbe',
    'Çarşenbe',
    'Penşenbe',
    'Anna',
    'Şenbe',
  ],
  'STANDALONEWEEKDAYS': [
    'Ýekşenbe',
    'Duşenbe',
    'Sişenbe',
    'Çarşenbe',
    'Penşenbe',
    'Anna',
    'Şenbe',
  ],
  'SHORTWEEKDAYS': ['Ýek', 'Duş', 'Siş', 'Çar', 'Pen', 'Ann', 'Şen'],
  'STANDALONESHORTWEEKDAYS': ['Ýek', 'Duş', 'Siş', 'Çar', 'Pen', 'Ann', 'Şen'],
  'NARROWWEEKDAYS': ['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'],
  'STANDALONENARROWWEEKDAYS': ['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'],
  'SHORTQUARTERS': ['K1', 'K2', 'K3', 'K4'],
  'QUARTERS': [
    '1-nji kwartal',
    '2-nji kwartal',
    '3-nji kwartal',
    '4-nji kwartal',
  ],
  'AMPMS': ['am', 'pm'],
  'DATEFORMATS': ['EEEE, d MMMM y', 'd MMMM y', 'd MMM y', 'dd/MM/y'],
  'TIMEFORMATS': ['HH:mm:ss zzzz', 'HH:mm:ss z', 'HH:mm:ss', 'HH:mm'],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': [6],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': ['{1}, {0}', '{1}, {0}', '{1}, {0}', '{1}, {0}'],
};

const List<String> _shortWeekdays = <String>[
  'Duş',
  'Siş',
  'Çar',
  'Pen',
  'Ann',
  'Şen',
  'Ýek',
];

const List<String> _shortMonths = <String>[
  'Ýan',
  'Few',
  'Mar',
  'Apr',
  'Maý',
  'Iýn',
  'Iýl',
  'Awg',
  'Sen',
  'Okt',
  'Noý',
  'Dek',
];

const List<String> _months = <String>[
  'Ýanwar',
  'Fewral',
  'Mart',
  'Aprel',
  'Maý',
  'Iýun',
  'Iýul',
  'Awgust',
  'Sentýabr',
  'Oktýabr',
  'Noýabr',
  'Dekabr',
];

class _TmCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TmCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tm';
  // locale.countryCode == 'TM' && locale.languageCode == 'tm';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    final localeName = intl.Intl.canonicalizedLocale('tm');
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: _tmDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(_tmSymbols),
    );

    final singleDigitHourFormat = intl.DateFormat('HH', localeName);
    final singleDigitMinuteFormat = intl.DateFormat.m(localeName);
    final singleDigitSecondFormat = intl.DateFormat.s(localeName);
    final dayFormat = intl.DateFormat.d(localeName);

    return SynchronousFuture<CupertinoLocalizations>(
      TmCupertinoLocalizations(
        localeName: localeName,
        decimalFormat: intl.NumberFormat('#,##0.###'), // 'en_US'
        fullYearFormat: intl.DateFormat('y', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        singleDigitHourFormat: singleDigitHourFormat,
        doubleDigitMinuteFormat: singleDigitMinuteFormat,
        dayFormat: dayFormat,
        singleDigitMinuteFormat: singleDigitMinuteFormat,
        singleDigitSecondFormat: singleDigitSecondFormat,
      ),
    );
  }

  @override
  bool shouldReload(_TmCupertinoLocalizationsDelegate old) {
    return false;
  }
}

class _TmMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _TmMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tm';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final localeName = intl.Intl.canonicalizedLocale(locale.toString());
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: _tmDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(_tmSymbols),
    );
    return SynchronousFuture<MaterialLocalizations>(
      TmMaterialLocalizations(
        localeName: localeName,
        decimalFormat: intl.NumberFormat('#,##0.###'), // 'en-US'
        twoDigitZeroPaddedFormat: intl.NumberFormat('00'), // en-US,
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_TmMaterialLocalizationsDelegate old) {
    return false;
  }
}

class TmCupertinoLocalizations extends GlobalCupertinoLocalizations {
  const TmCupertinoLocalizations({
    required super.fullYearFormat,
    required super.dayFormat,
    required super.mediumDateFormat,
    required super.singleDigitHourFormat,
    required super.singleDigitMinuteFormat,
    required super.doubleDigitMinuteFormat,
    required super.singleDigitSecondFormat,
    required super.decimalFormat,
    super.localeName = 'tm',
  });

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _TmCupertinoLocalizationsDelegate();

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) =>
      dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => '$hour sagat';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return '$minute minut';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => 'Şu gün';

  @override
  String get alertDialogLabel => 'Üns beriň';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    assert(tabIndex >= 1, '');
    assert(tabCount >= 1, '');
    return '$tabCount arasynda $tabIndex-nji jübi';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'sagat' : 'sagat';

  @override
  List<String> get timerPickerHourLabels => const <String>['sagat', 'sagat'];

  @override
  String timerPickerMinuteLabel(int minute) => 'min.';

  @override
  List<String> get timerPickerMinuteLabels => const <String>['min.'];

  @override
  String timerPickerSecondLabel(int second) => 'sek.';

  @override
  List<String> get timerPickerSecondLabels => const <String>['sek.'];

  @override
  String get cutButtonLabel => 'Kesmek';

  @override
  String get copyButtonLabel => 'Kopiýala';

  @override
  String get pasteButtonLabel => 'Giriz';

  @override
  String get selectAllButtonLabel => 'Hemmesini saýla';

  @override
  String get searchTextFieldPlaceholderLabel => 'Gözle';

  @override
  String get modalBarrierDismissLabel => 'Öçür';

  @override
  String get datePickerDateOrderString => 'dmy';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String? get datePickerHourSemanticsLabelFew => r'$hour sagat';

  @override
  String? get datePickerHourSemanticsLabelMany => r'$hour sagat';

  @override
  String get tabSemanticsLabelRaw => r'$tabCount arasynda $tabIndex-nji jübi';

  @override
  String get timerPickerHourLabelOther => 'sagat';

  @override
  String get timerPickerMinuteLabelOther => 'min.';

  @override
  String get timerPickerSecondLabelOther => 'sеk.';

  @override
  String get datePickerHourSemanticsLabelOther => r'$hour sagat';

  @override
  String get datePickerMinuteSemanticsLabelOther => r'$minute minut';

  @override
  String get noSpellCheckReplacementsLabel => '';
}

class TmMaterialLocalizations extends GlobalMaterialLocalizations {
  const TmMaterialLocalizations({
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
    super.localeName = 'tm',
  });

  @override
  String get keyboardKeyAlt => 'Alt';
  @override
  String get keyboardKeyAltGraph => 'AltGr';
  @override
  String get keyboardKeyBackspace => 'Backspace';
  @override
  String get keyboardKeyCapsLock => 'Caps Lock';
  @override
  String get keyboardKeyChannelDown => 'Channel Down';
  @override
  String get keyboardKeyChannelUp => 'Channel Up';
  @override
  String get keyboardKeyControl => 'Ctrl';
  @override
  String get keyboardKeyDelete => 'Del';
  @override
  String get keyboardKeyEject => 'Eject';
  @override
  String get keyboardKeyEnd => 'End';
  @override
  String get keyboardKeyEscape => 'Esc';
  @override
  String get keyboardKeyFn => 'Fn';
  @override
  String get keyboardKeyHome => 'Home';
  @override
  String get keyboardKeyInsert => 'Insert';
  @override
  String get keyboardKeyMeta => 'Meta';
  @override
  String get keyboardKeyMetaMacOs => 'Command';
  @override
  String get keyboardKeyMetaWindows => 'Win';
  @override
  String get keyboardKeyNumLock => 'Num Lock';
  @override
  String get keyboardKeyNumpad1 => 'Num 1';
  @override
  String get keyboardKeyNumpad2 => 'Num 2';
  @override
  String get keyboardKeyNumpad3 => 'Num 3';
  @override
  String get keyboardKeyNumpad4 => 'Num 4';
  @override
  String get keyboardKeyNumpad5 => 'Num 5';
  @override
  String get keyboardKeyNumpad6 => 'Num 6';
  @override
  String get keyboardKeyNumpad7 => 'Num 7';
  @override
  String get keyboardKeyNumpad8 => 'Num 8';
  @override
  String get keyboardKeyNumpad9 => 'Num 9';
  @override
  String get keyboardKeyNumpad0 => 'Num 0';
  @override
  String get keyboardKeyNumpadAdd => 'Num +';
  @override
  String get keyboardKeyNumpadComma => 'Num ,';
  @override
  String get keyboardKeyNumpadDecimal => 'Num .';
  @override
  String get keyboardKeyNumpadDivide => 'Num /';
  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';
  @override
  String get keyboardKeyNumpadEqual => 'Num =';
  @override
  String get keyboardKeyNumpadMultiply => 'Num *';
  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';
  @override
  String get keyboardKeyNumpadParenRight => 'Num )';
  @override
  String get keyboardKeyNumpadSubtract => 'Num -';
  @override
  String get keyboardKeyPageDown => 'PgDown';
  @override
  String get keyboardKeyPageUp => 'PgUp';
  @override
  String get keyboardKeyPower => 'Power';
  @override
  String get keyboardKeyPowerOff => 'Power Off';
  @override
  String get keyboardKeyPrintScreen => 'Print Screen';
  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';
  @override
  String get keyboardKeySelect => 'Select';
  @override
  String get keyboardKeySpace => 'Space';
  String get keyboardKeyEisu => 'Eisu';
  String get keyboardKeyHangulMode => 'HangulMode';
  String get keyboardKeyHanjaMode => 'HanjaMode';
  String get keyboardKeyHankaku => 'Hankaku';
  String get keyboardKeyHiragana => 'Hiragana';
  String get keyboardKeyHiraganaKatakana => 'HiraganaKatakana';
  String get keyboardKeyKanaMode => 'KanaMode';
  String get keyboardKeyKanjiMode => 'KanjiMode';
  String get keyboardKeyKatakana => 'Katakana';
  String get keyboardKeyRomaji => 'Romaji';
  String get keyboardKeyZenkaku => 'Zenkaku';
  String get keyboardKeyZenkakuHankaku => 'ZenkakuHankaku';

  @override
  String get moreButtonTooltip => 'Giňişleýin';

  @override
  String get firstPageTooltip => 'Baş sahypa';

  @override
  String get lastPageTooltip => 'Soňky sahypa';

  @override
  String get aboutListTileTitleRaw => r'$applicationName hakda';

  @override
  String get alertDialogLabel => 'Üns beriň';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Dolan';

  @override
  String get cancelButtonLabel => 'ÖÇÜR';

  @override
  String get closeButtonLabel => 'ÝAPMAK';

  @override
  String get closeButtonTooltip => 'Ýapmak';

  @override
  String get collapsedIconTapHint => 'Giňelt';

  @override
  String get continueButtonLabel => 'DOWAM ET';

  @override
  String get copyButtonLabel => 'GÖÇÜR';

  @override
  String get cutButtonLabel => 'KES';

  @override
  String get deleteButtonTooltip => 'Poz';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Nawigasiýa menýusy';

  @override
  String get expandedIconTapHint => 'Kiçelt';

  @override
  String get hideAccountsLabel => 'Akkaundy gizle';

  @override
  String get licensesPageTitle => 'Lisenziýalar';

  @override
  String get modalBarrierDismissLabel => 'Öçür';

  @override
  String get nextMonthTooltip => 'Indiki aý';

  @override
  String get nextPageTooltip => 'Indiki sahypa';

  @override
  String get okButtonLabel => 'Bolyar';

  @override
  String get openAppDrawerTooltip => 'Menýu çekmesi';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow of about $rowCount';

  @override
  String get pasteButtonLabel => 'GIRIZ';

  @override
  String get popupMenuLabel => 'Popup menýu';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Öňki aý';

  @override
  String get previousPageTooltip => 'Öňki sahypa';

  @override
  String get refreshIndicatorSemanticLabel => 'Täzele';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => '1 harp galdy';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount harplar galdy';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => 'Hiç harp galmady';

  @override
  String get reorderItemDown => 'Aşak geçir';

  @override
  String get reorderItemLeft => 'Çepe geçir';

  @override
  String get reorderItemRight => 'Saga geçir';

  @override
  String get reorderItemToEnd => 'Soňuna geçir';

  @override
  String get reorderItemToStart => 'Başyna geçir';

  @override
  String get reorderItemUp => 'Yokary geçir';

  @override
  String get rowsPerPageTitle => 'Sahypa başyna hatar:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Gözle';

  @override
  String get selectAllButtonLabel => 'HEMMESINI SAÝLA';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => '1 element saýlandy';

  @override
  String get selectedRowCountTitleOther =>
      r'$selectedRowCount elementler saýlandy';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => 'Hiç element saýlanmady';

  @override
  String get showAccountsLabel => 'Akkauntlary aç';

  @override
  String get showMenuTooltip => 'Menýuny aç';

  @override
  String get signedInLabel => 'Ulgamda';

  @override
  String get tabLabelRaw => r'$tabCount içinden $tabIndex tab';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerHourModeAnnouncement => 'Sagady saýlaň';

  @override
  String get timePickerMinuteModeAnnouncement => 'Minudy saýlaň';

  @override
  String get viewLicensesButtonLabel => 'LISENZIÝALARY GÖRKEZ';

  @override
  List<String> get narrowWeekdays =>
      const <String>['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _TmMaterialLocalizationsDelegate();

  @override
  String get calendarModeButtonLabel => 'Senenama geç';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'Senesini giriziň';

  @override
  String get dateOutOfRangeLabel => 'Aralykdan geçdi.';

  @override
  String get datePickerHelpText => 'SENESINI SAÝLAŇ';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'Gutarýan sene $fullDate';

  @override
  String get dateRangeEndLabel => 'Gutarýan sene';

  @override
  String get dateRangePickerHelpText => 'SENE ARALYGY';

  @override
  String get dateRangeStartDateSemanticLabelRaw => r'Başlangyç sene $fullDate';

  @override
  String get dateRangeStartLabel => 'Başlangyç sene';

  @override
  String get dateSeparator => '/';

  @override
  String get dialModeButtonLabel => 'Belgi saýlaýyja geçmek';

  @override
  String get inputDateModeButtonLabel => 'Girizmege geç';

  @override
  String get inputTimeModeButtonLabel => 'Tekst girizmege geç';

  @override
  String get invalidDateFormatLabel => 'Ýalňyş format.';

  @override
  String get invalidDateRangeLabel => 'Ýalňyş format.';

  @override
  String get invalidTimeLabel => 'Dogry wagty giriziň';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount licenses';

  @override
  String get saveButtonLabel => 'ÝATLA';

  @override
  String get selectYearSemanticsLabel => 'Ýyly saýlaň';

  @override
  String get timePickerDialHelpText => 'WAGTY SAÝLAŇ';

  @override
  String get timePickerHourLabel => 'Sagat';

  @override
  String get timePickerInputHelpText => 'WAGTY GIRIZIŇ';

  @override
  String get timePickerMinuteLabel => 'Minut';

  @override
  String get unspecifiedDate => 'Sene';

  @override
  String get unspecifiedDateRange => 'Sene aralygy';

  @override
  String get menuBarMenuLabel => 'Menu';

  @override
  String get bottomSheetLabel => '';

  @override
  String get currentDateLabel => '';

  @override
  String get keyboardKeyShift => '';

  @override
  String get scrimLabel => '';

  @override
  String get scrimOnTapHintRaw => '';

  @override
  String get collapsedHint => '';

  @override
  String get expandedHint => '';

  @override
  String get expansionTileCollapsedHint => '';

  @override
  String get expansionTileCollapsedTapHint => '';

  @override
  String get expansionTileExpandedHint => '';

  @override
  String get expansionTileExpandedTapHint => '';

  @override
  String get scanTextButtonLabel => '';
}
