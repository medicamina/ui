import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsNotificationsWidget extends StatefulWidget {
  const MedicaminaDashSettingsNotificationsWidget({super.key});

  @override
  State<MedicaminaDashSettingsNotificationsWidget> createState() => _MedicaminaDashSettingsNotificationsWidgetState();
}

class _MedicaminaDashSettingsNotificationsWidgetState extends State<MedicaminaDashSettingsNotificationsWidget> {
  bool _marketingEmails = false;
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _enableNotifications = value;
                });
              },
              initialValue: _enableNotifications,
              leading: Icon(Icons.notifications_active),
              title: Text('Enable notifications'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _marketingEmails = value;
                });
              },
              initialValue: _marketingEmails,
              leading: Icon(Icons.mail),
              title: Text('Enable marketing emails'),
              description: Text('Notifications'),
            ),
          ],
        ),
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
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(onPressed: () {}, child: Text('Submit')),
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