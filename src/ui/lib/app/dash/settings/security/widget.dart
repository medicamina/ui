import 'package:flutter/material.dart';
import 'package:medicamina/app/dash/settings/security/desktop.dart';
import 'package:medicamina/app/dash/settings/security/mobile.dart';

class MedicaminaDashSettingsSecurityWidget extends StatefulWidget {
  const MedicaminaDashSettingsSecurityWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsSecurityWidget> createState() => _MedicaminaDashSettingsSecurityWidget();
}

class _MedicaminaDashSettingsSecurityWidget extends State<MedicaminaDashSettingsSecurityWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (1000 > MediaQuery.of(context).size.width) {
      widget = const MedicaminaDashSettingsSecurityMobileWidget();
    } else {
      widget = const MedicaminaDashSettingsSecurityDesktopWidget();
    }

    return widget;
  }
}