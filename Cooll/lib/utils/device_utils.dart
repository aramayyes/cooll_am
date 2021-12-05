import 'dart:io';

import 'package:flutter/material.dart';

class DeviceUtils {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getDeviceLocale() => Platform.localeName.split('_').first;
}
