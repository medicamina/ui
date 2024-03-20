import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/settings/physician/edit/widget.dart';
import 'package:medicamina_ui/dash/settings/physician/join/widget.dart';
import 'package:medicamina_ui/dash/settings/physician/widget.dart';
import 'package:medicamina_ui/dash/settings/widget.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPhysicianViewPhysicianWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhysicianViewPhysicianWidget({super.key, required this.physicianAccount});
  final physicianAccount;

  @override
  State<MedicaminaDashSettingsPhysicianViewPhysicianWidget> createState() => _MedicaminaDashSettingsPhysicianViewPhysicianWidget();
}

class _MedicaminaDashSettingsPhysicianViewPhysicianWidget extends State<MedicaminaDashSettingsPhysicianViewPhysicianWidget> {
  // var i;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          title: Text('Physician account'),
          tiles: [
            SettingsTile(
              title: Text(widget.physicianAccount != null ? widget.physicianAccount['name'] : 'Unknown'),
            ),
          ],
        ),
        MedicaminaDashSettingsPhysicianClinicsWidget(physicianAccount: widget.physicianAccount),
        SettingsSection(tiles: [CustomSettingsTile(child: SizedBox(height: 2))]),
        SettingsSection(
          margin: EdgeInsetsDirectional.only(top: 0),
          tiles: [
            CustomSettingsTile(
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.settings.name == 'home');
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MedicaminaDashSettingsPhysicianClinicsWidget extends AbstractSettingsSection {
  const MedicaminaDashSettingsPhysicianClinicsWidget({required this.physicianAccount, super.key});
  final physicianAccount;

  @override
  Widget build(BuildContext context) {
    if (physicianAccount == null) {
      return const SizedBox.shrink();
    }
    return SettingsSection(
      title: Text('Clinics'),
      tiles: [
        SettingsTile.navigation(
          description: Text('Join a new clinic'),
          leading: Icon(CupertinoIcons.signature),
          title: Text('Join Clinic'),
          onPressed: (context) {
            Navigation.navigateTo(context: context, screen: const MedicaminaDashSettingsPhysicianJoinWidget(), style: NavigationRouteStyle.material);
          },
        ),
        for (var clinic in physicianAccount['clinics']) MedicaminaDashSettingsPhysicianClinicsWidgetTile(clinic: clinic),
      ],
    );
  }
}

class MedicaminaDashSettingsPhysicianClinicsWidgetTile extends AbstractSettingsTile {
  const MedicaminaDashSettingsPhysicianClinicsWidgetTile({this.clinic, super.key});
  final clinic;

  @override
  Widget build(BuildContext context) {
    return SettingsTile.navigation(
      title: Text(clinic['name']),
      leading: Icon(CupertinoIcons.building_2_fill),
      onPressed: (context) {
        Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPhysicianClinicEditWidget(clinic: clinic), style: NavigationRouteStyle.material);
      },
    );
  }
}
