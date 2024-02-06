import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsClinicJoinWidget extends StatefulWidget {
  const MedicaminaDashSettingsClinicJoinWidget({super.key});

  @override
  State<MedicaminaDashSettingsClinicJoinWidget> createState() => _MedicaminaDashSettingsClinicJoinWidgetState();
}

class _MedicaminaDashSettingsClinicJoinWidgetState extends State<MedicaminaDashSettingsClinicJoinWidget> {
  bool _submitting = false;
  final _joinClinicFormKey = GlobalKey<FormState>();
  String? _joinCode = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _joinClinicFormKey,
        child: SettingsList(
          platform: DevicePlatform.iOS,
          darkTheme: const SettingsThemeData(
            settingsListBackground: Color.fromARGB(255, 48, 48, 48),
            settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
          ),
          sections: [
            SettingsSection(
              title: Text('Join a clinic'),
              tiles: [
                SettingsTile(
                  description: Text('Join code'),
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: TextFormField(
                      // controller: _clinicController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a clinic id';
                        }
                        return null;
                      }),
                      onChanged: (value) {
                        setState(() {
                          _joinCode = value;
                        });
                      },
                      decoration: InputDecoration.collapsed(hintText: 'Enter a join code'),
                    ),
                  ),
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
                          onPressed: _submitting
                              ? null
                              : () {
                                  Navigator.pop(context);
                                },
                          child: Text('Cancel'),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 3,
                        child: OutlinedButton(
                          onPressed: _submitting
                              ? null
                              : () {
                                  if (_joinClinicFormKey.currentState!.validate()) {
                                    setState(() {
                                      _submitting = true;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                    const url = kReleaseMode ? 'medicamina.azurewebsites.net' : 'localhost:8080';
                                    http
                                        .post(
                                      Uri.https(url, 'dash/settings/clinic/join'),
                                      headers: <String, String>{
                                        'Content-Type': 'application/json; charset=UTF-8',
                                        'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                      },
                                      body: jsonEncode(
                                        {
                                          'joinCode': _joinCode,
                                        },
                                      ),
                                    )
                                        .then(
                                      (response) {
                                        setState(() {
                                          _submitting = false;
                                        });
                                        if (response.statusCode == 200) {
                                          Navigator.maybePop(context);
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
                                        }
                                      },
                                    );
                                  }
                                },
                          child: Text('Submit'),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
