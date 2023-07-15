

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String isDarkMode='isDarkMode';
class SharedPref{
  
  static Future<ThemeMode> getDarkMode() async {
    final shp = await SharedPreferences.getInstance();
    final darkMode = shp.getBool(isDarkMode);

    if (darkMode != null) {
      return darkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.light;
    }
  }

  static Future<void> setDarkMode(bool darkMode) async {
    final shp = await SharedPreferences.getInstance();
    shp.setBool(isDarkMode, darkMode);
  }

}