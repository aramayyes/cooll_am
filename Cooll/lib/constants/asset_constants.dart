import 'package:flutter/material.dart';

class AssetConstants {
  AssetConstants._();

  static const _root = 'assets';
  static const _imagesRoot = '$_root/images';
  static const _iconsRoot = '$_imagesRoot/icons';
  static const _langRoot = '$_root/locale';

  static const langEn = '$_langRoot/en.json';
  static const langHy = '$_langRoot/hy.json';

  // Icons
  static const appLogo = '$_iconsRoot/app_logo.svg';

  static String getLanguageAsset(Locale locale) =>
      '$_langRoot/${locale.languageCode}.json';
}
