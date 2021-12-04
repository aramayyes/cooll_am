import 'dart:io';

import 'package:cooll/theme/app_colors.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:cooll/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    splashColor: Platform.isIOS ? Colors.transparent : null,
    highlightColor: Platform.isIOS ? Colors.transparent : null,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary,
        onPrimary: AppColors.buttonText,
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: AppTypography.buttonText,
          fontWeight: FontWeight.normal,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.buttonCornerRadius),
          ),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
  );

  static final darkTheme = lightTheme;
}
