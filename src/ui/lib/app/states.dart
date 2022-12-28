import 'dart:async';
import 'package:flutter/material.dart';

class MedicaminaAppBarLoadingState {
  static late bool loading;
  static StreamController<bool> controller = StreamController<bool>.broadcast();

  MedicaminaAppBarLoadingState() {
    setLoading(false);
  }

  void setLoading(bool _loading) {
    loading = _loading;
    controller.add(loading);
  }

  bool getLoading() {
    return loading;
  }

  Stream getStream() {
    return controller.stream;
  }
}

class MedicaminaThemeState {
  static late bool _darkMode;

  MedicaminaThemeState() {
    setDarkModeFromDeviceBrightness();
  }

  ThemeMode getThemeMode() {
    if (_darkMode) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void setDarkModeFromDeviceBrightness() {
    var platformBrightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window).platformBrightness;
    if (platformBrightness == Brightness.dark) {
      _darkMode = true;
      return;
    }
    _darkMode = false;
  }

  void setDarkMode(bool isDark) {
    _darkMode = isDark;
  }
  
  bool getDarkMode() {
    return _darkMode;
  }
}
