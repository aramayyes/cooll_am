import 'dart:convert';

import 'package:cooll/constants/asset_constants.dart';
import 'package:cooll/enums/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static final AppLocalizations _singleton = AppLocalizations._();

  late Map<String, String> _localizedStrings;
  late Locale _locale;

  Locale get locale => _locale;

  factory AppLocalizations() => _singleton;

  AppLocalizations._();

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  Future<void> load(Locale locale) async {
    _locale = locale;

    // Load the language JSON file from the "lang" folder.
    final jsonString =
        await rootBundle.loadString(AssetConstants.getLanguageAsset(locale));
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) => MapEntry(
        key, value.toString().replaceAll(r"\'", "'").replaceAll(r'\t', ' ')));
  }

  String _translate(String key, {String? defaultValue}) =>
      _localizedStrings[key] ?? defaultValue ?? '![missing translation]';

  String get appName => _translate('globals.appName');

  String get signIn => _translate('globals.signIn');

  String get homeBarItem => _translate('globals.homeBarItem');

  String get shopBarItem => _translate('globals.shopBarItem');

  String get sellACarBarItem => _translate('globals.sellACarBarItem');

  String get signInBarItem => _translate('globals.signInBarItem');

  String get moreBarItem => _translate('globals.moreBarItem');

  String get noData => _translate('globals.noData');

  String price(double price) {
    final format = NumberFormat("#,##0", "hy_AM");
    return sprintf(_translate('globals.price'), [format.format(price)]);
  }

  String productCardMileage(double mileage) {
    final format = NumberFormat("#,##0", "hy_AM");
    return sprintf(_translate('productCard.mileage'), [format.format(mileage)]);
  }

  String productCardEngineCapacity(double engineCapacity) =>
      sprintf(_translate('productCard.engineCapacity'), [engineCapacity]);

  String get tryAgainButton => _translate('globals.tryAgainButton');

  String get errorDefaultTitle => _translate('errors.defaultTitle');

  String get errorDefaultMessage => _translate('errors.defaultMessage');

  String get errorTapToTryAgain => _translate('errors.tapToTryAgain');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  static final supportedLocaleCodes =
      List<String>.unmodifiable(AppLocale.values.map((lang) => lang.getCode()));

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      supportedLocaleCodes.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations();
    await appLocalizations.load(locale);
    return appLocalizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
