import 'package:cooll/enums/app_locale.dart';
import 'package:cooll/localization/app_localization.dart';
import 'package:cooll/shared_preferences/app_locale_preference.dart';
import 'package:flutter/material.dart';

/// Contains application localization state.
class AppLocaleModel extends ChangeNotifier {
  Locale _locale;

  Locale get locale => _locale;

  AppLocaleModel(String initialLocale) : _locale = Locale(initialLocale, '');

  Future<void> setLanguage(BuildContext context, AppLocale appLocale) =>
      setLocale(context, Locale(appLocale.getCode()));

  Future<void> setLocale(BuildContext context, Locale locale) async {
    if (locale.languageCode != _locale.languageCode) {
      _locale = locale;
      await AppLocalizations().load(locale);

      // Save to shared preferences.
      await AppLocalePreference.saveLocaleCode(locale.languageCode);

      notifyListeners();
    }
  }
}
