import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'colors.dart';

class DataConstants {
  static var lightTheme =
      ThemeData(useMaterial3: true, colorScheme: lightColorScheme);

  static var darkTheme =
      ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

  static var platformBrightness =
      SchedulerBinding.instance.window.platformBrightness;

  static var currentTheme =
      (platformBrightness == Brightness.light) ? lightTheme : darkTheme;

  static bool isDarkTheme = false;

  static String appbarContent = "Local Postman";
}
