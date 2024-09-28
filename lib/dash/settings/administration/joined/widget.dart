import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsClinicJoinedWidget extends AbstractSettingsTile {
  final clinic;
  MedicaminaDashSettingsClinicJoinedWidget({required this.clinic, super.key});
  final dio = Dio();

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
          title: Text('Clinic'),
          tiles: [
            SettingsTile(title: Text(clinic['name'])),
          ],
        ),
        SettingsSection(tiles: [
          SettingsTile(
            title: Text('LEAVE CLINIC', style: TextStyle(color: Colors.red)),
            trailing: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onPressed: (context) async {
              showDialog(
                  context: context,
                  builder: (context2) {
                    return AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text('Are you sure you want to leave this clinic? You will no longer have access to this clinic.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context2);
                          },
                          child: Text('CANCEL'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red.withAlpha(50)),
                          ),
                          onPressed: () async {
                            Navigator.pop(context2);
                            var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/clinic/leave' : 'http://localhost:8080/dash/settings/clinic/leave';
                            var response = await dio.post(
                              url,
                              options: Options(
                                headers: {
                                  'Content-Type': 'application/json; charset=UTF-8',
                                  'Authorization': await Modular.get<MedicaminaUserState>().getToken(),
                                },
                                validateStatus: (status) => true,
                              ),
                              data: {
                                'clinicId': clinic['id'],
                              },
                            );
                            if (response.statusCode == 200) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
                            }
                          },
                          child: Text('LEAVE', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  });
            },
          ),
        ]),
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
