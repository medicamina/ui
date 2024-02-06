
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsLanguageWidget extends StatefulWidget {
  const MedicaminaDashSettingsLanguageWidget({super.key});

  @override
  State<MedicaminaDashSettingsLanguageWidget> createState() => _MedicaminaDashSettingsLanguageWidgetState();
}

class _MedicaminaDashSettingsLanguageWidgetState extends State<MedicaminaDashSettingsLanguageWidget> {
  bool _englishSelected = true;
  bool _japaneseSelected = false;

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
            SettingsTile(
              title: Text('English'),
              trailing: _englishSelected ? Icon(Icons.check) : null,
              onPressed: (context) {
                setState(() {
                  _englishSelected = true;
                  _japaneseSelected = false;
                });
                print('Hello');
              },
            ),
            SettingsTile(
              title: Text('日本語'),
              trailing: _japaneseSelected ? Icon(Icons.check) : null,
              onPressed: (context) {
                setState(() {
                  _englishSelected = false;
                  _japaneseSelected = true;
                });
              },
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
                        child: Text('Cancel')),
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
