import 'dart:ui';

import '../data/services/preferences.dart';

class AppLocales {
  static Locale get locale => S().languageCode.isEmpty
      ? window.locale
      : S().languageCode == 'en'
          ? Locale('en')
          : Locale('zh');
}
