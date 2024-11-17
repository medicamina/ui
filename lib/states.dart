import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:event/event.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

class MedicaminaThemeState {
  static late bool _darkMode;
  var changedState = Event();

  MedicaminaThemeState() {
    setDarkModeFromDeviceBrightness();
  }

  ThemeMode getThemeMode() {
    print(_darkMode);
    if (_darkMode) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void setDarkModeFromDeviceBrightness() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final bool? darkMode = prefs.getBool('darkMode');

      if (darkMode != null) {
        _darkMode = darkMode;
        return;
      }
    } catch (e) {
      print(e);
    }

    var platformBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    if (platformBrightness == Brightness.dark) {
      _darkMode = true;
      return;
    }
    _darkMode = false;
  }

  void setDarkMode(bool isDark) async {
    _darkMode = isDark;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', isDark);
  }

  bool getDarkMode() {
    return _darkMode;
  }
}

class MedicaminaUserState {
  static String? jwtToken;

  MedicaminaUserState();

  void login(String token) async {
    jwtToken = token;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('jwtToken', jwtToken!);
  }

  void logout() async {
    jwtToken = null;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('jwtToken');
  }

  Future<String?> getToken() async {
    if (jwtToken != null) {
      return jwtToken;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String? jwtToken = prefs.getString('jwtToken');

      if (jwtToken != null) {
        return jwtToken;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}


Future<File?> compressFile(File file, {int quality = 30}) async {
  final dir = await path_provider.getTemporaryDirectory();
  final targetPath = dir.absolute.path + '/${Random().nextInt(1000)}-temp.jpg';

  var _compressedFile = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality,
  );

  return File(_compressedFile!.path);
}

