import 'package:flutter/material.dart';
import 'package:medicamina/dash/settings/security/desktop.dart';
import 'package:medicamina/dash/settings/security/mobile.dart';

class MedicaminaDashSettingsSecurityWidget extends StatelessWidget {
  const MedicaminaDashSettingsSecurityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1000 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsSecurityMobileWidget();
    }
    return const MedicaminaDashSettingsSecurityDesktopWidget();
  }
}
