import 'package:shared_preferences/shared_preferences.dart';

class AppLocalePreference {
  static const _localeKey = 'locale';

  static Future<String?> getLocaleCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeKey);
  }

  static Future<void> saveLocaleCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, code);
  }
}
