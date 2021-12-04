import 'package:cooll/localization/app_localization.dart';
import 'package:cooll/models/app_locale_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension Theming on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppLocaleModel localeModel({bool listen = true}) =>
      Provider.of<AppLocaleModel>(this, listen: listen);

  AppLocalizations get l => AppLocalizations.of(this);
}
