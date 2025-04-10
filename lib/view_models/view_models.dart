import 'dart:ui';
import 'package:darss/datasources/local_datasources.dart';
import 'package:flutter/material.dart';
class ViewModel {
  ViewModel._ichkiKonstruktor();

  static final ViewModel _obyekt = ViewModel._ichkiKonstruktor();

  factory ViewModel() {
    return _obyekt;
  }

  bool isDarkMode = false;
  double fontSize = 14;
  Color textColor = Colors.black;
  Color backgroundColor = Colors.white;
  List<String> ozbekMaqollar = [
    "Yaxshilik qil, darak kutma.",
    "Yomon do‘stdan yaxshi dushman afzal.",
    "Oz – oz, qo‘shilsa – ko‘l bo‘lur.",
    "Do‘st boshidan, dushman oyog‘idan bilinadi.",
    "Til — qalbning tarjimoni.",
    "Ko‘p yugurgan emas, to‘g‘ri yugurgan yutadi.",
    "Ilm – boylikdan afzal.",
    "Yolg‘onning oyog‘i kalta.",
    "Bir kunlik mehmon – ming kunlik gap.",
    "Ko‘z qorachiqlaridek asra.",
  ];

  final SettingsLocalDataSource _settingsLocalDataSource =
  SettingsLocalDataSource();

  Future<void> saveSettings() async {
    await _settingsLocalDataSource.saveSettings(
      isDarkMode: isDarkMode,
      fontSize: fontSize,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
    print("save Settings: ${fontSize}");
  }

  Future<void> getSettings() async {
    final settings = await _settingsLocalDataSource.getSettings();

    isDarkMode = settings.isDarkMode ?? false;
    fontSize = settings.fontSize ?? 14.0;
    textColor = settings.textColor != null ? Color(settings.textColor) : Colors.black;
    backgroundColor = settings.backgroundColor != null ? Color(settings.backgroundColor) : Colors.white;

    print("get Settings: ${fontSize}");
  }
}
