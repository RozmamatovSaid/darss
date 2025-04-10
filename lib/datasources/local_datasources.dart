import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/settings_model.dart';

class SettingsLocalDataSource {
  Future<void> saveSettings({
    required bool isDarkMode,
    required double fontSize,
    required Color textColor,
    required Color backgroundColor,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkMode", isDarkMode);
    await prefs.setDouble("fontSize", fontSize);
    await prefs.setInt("textColor", textColor.value);
    await prefs.setInt("backgroundColor", backgroundColor.value);
  }

  Future<SettingsModel> getSettings() async {
    final prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool("isDarkMode") ?? false;
    double fontSize = prefs.getDouble("fontSize") ?? 14.0;
    int textColorValue = prefs.getInt("textColor") ?? Colors.black.value;
    int backgroundColorValue = prefs.getInt("backgroundColor") ?? Colors.white.value;

    return SettingsModel(
      isDarkMode: isDark,
      fontSize: fontSize,
      textColor: textColorValue,
      backgroundColor: backgroundColorValue,
    );
  }
}
