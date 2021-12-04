import 'package:flutter/material.dart';

class AssetConstants {
  AssetConstants._();

  static const root = 'assets';
  static const langRoot = '$root/locale';

  static const langEn = '$langRoot/en.json';
  static const langHy = '$langRoot/hy.json';

  static String getLanguageAsset(Locale locale) =>
      '$langRoot/${locale.languageCode}.json';
}
