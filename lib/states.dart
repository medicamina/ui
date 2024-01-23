import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:event/event.dart';

class MedicaminaThemeState {
  static late bool _darkMode;
  var changedState = Event();

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
    // TODO: Check this?
    var platformBrightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
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

class MedicaminaUserState {
  static String? jwtToken;

  MedicaminaUserState();

  void login(String token) {
    jwtToken = token;
  }

  void logout() {
    jwtToken = null;
  }

  String? getToken() {
    return jwtToken;
  }
}

