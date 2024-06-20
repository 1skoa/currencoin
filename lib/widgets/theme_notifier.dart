import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
  system,
}

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // По умолчанию системная тема

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        _themeMode = ThemeMode.light;
        break;
      case ThemeType.dark:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeType.system:
        _themeMode = ThemeMode.system;
        break;
    }
    notifyListeners(); // Уведомляем слушателей об изменении темы
  }
}
