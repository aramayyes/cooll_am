import 'dart:io';

import 'package:flutter/material.dart';

/// Helper class for device related operations.
class DeviceUtils {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getDeviceLocale() => Platform.localeName.split('_').first;
}
