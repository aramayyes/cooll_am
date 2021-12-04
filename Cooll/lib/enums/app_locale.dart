import 'package:cooll/utils/char_utils.dart';

enum AppLocale {
  hy,
  en,
}

extension InfoProviding on AppLocale {
  String getTitle() {
    switch (this) {
      case AppLocale.hy:
        return 'Հայերեն';
      case AppLocale.en:
        return 'English';
    }
  }

  String getCode() {
    switch (this) {
      case AppLocale.hy:
        return 'hy';
      case AppLocale.en:
        return 'en';
    }
  }

  String getCharFlag() {
    switch (this) {
      case AppLocale.hy:
        return CharUtils.generateFlagEmojiCode(countryCode: 'AM');
      case AppLocale.en:
        return CharUtils.generateFlagEmojiCode(countryCode: 'GB');
    }
  }
}
