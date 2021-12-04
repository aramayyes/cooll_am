import 'package:cooll/enums/app_locale.dart';
import 'package:cooll/main.dart';
import 'package:cooll/models/app_locale_model.dart';
import 'package:cooll/routes.dart';
import 'package:cooll/shared_preferences/app_locale_preference.dart';
import 'package:cooll/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRunner {
  static Future<void> run() async {
    final localeCode = await _getLocaleCode();
    final initialRoute = await _getInitialRoute();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLocaleModel>(
            create: (_) => AppLocaleModel(localeCode),
          ),
        ],
        child: CoollApp(initialRoute: initialRoute),
      ),
    );
  }

  static Future<String> _getLocaleCode() async {
    var localeCode = await AppLocalePreference.getLocaleCode();
    if (localeCode == null) {
      final defaultSystemLocaleCode = DeviceUtils.getDeviceLocale();
      localeCode = AppLocale.values
          .firstWhere(
            (language) => language.getCode() == defaultSystemLocaleCode,
            orElse: () => AppLocale.en,
          )
          .getCode();
    }

    return localeCode;
  }

  static Future<String> _getInitialRoute() async {
    return Routes.rootHome;
  }
}
