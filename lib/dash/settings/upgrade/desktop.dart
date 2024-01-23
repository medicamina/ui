import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashSettingsDesktopUpgradeWidget extends StatefulWidget {
  const MedicaminaDashSettingsDesktopUpgradeWidget({super.key});

  @override
  State<MedicaminaDashSettingsDesktopUpgradeWidget> createState() => _MedicaminaDashSettingsDesktopUpgradeWidgetState();
}

class _MedicaminaDashSettingsDesktopUpgradeWidgetState extends State<MedicaminaDashSettingsDesktopUpgradeWidget> {
  TextStyle? getDividerLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13.66, fontWeight: FontWeight.normal);
    }
    return Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13.66, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upgrade', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            const Divider(height: 1),
            const SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Select specialty',
                    style: getDividerLabelStyle(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
