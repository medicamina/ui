
import 'package:flutter/cupertino.dart';
import 'package:medicamina_ui/dash/settings/upgrade/desktop.dart';
import 'package:medicamina_ui/dash/settings/upgrade/mobile.dart';

class MedicaminaDashSettingsUpgradeWidget extends StatefulWidget {
  const MedicaminaDashSettingsUpgradeWidget({super.key});

  @override
  State<MedicaminaDashSettingsUpgradeWidget> createState() => _MedicaminaDashSettingsUpgradeWidgetState();
}

class _MedicaminaDashSettingsUpgradeWidgetState extends State<MedicaminaDashSettingsUpgradeWidget> {

  @override
  Widget build(BuildContext context) {
    if (1024 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsMobileUpgradeWidget();
    }
    return const MedicaminaDashSettingsDesktopUpgradeWidget();
  }
}