import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/settings/desktop.dart';
import 'package:medicamina_ui/dash/settings/mobile.dart';

class MedicaminaDashSettingsWidget extends StatelessWidget {
  const MedicaminaDashSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1000 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsMobileWidget();
    }
    return const MedicaminaDashSettingsDesktopWidget();
  }
}
