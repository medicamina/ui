import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/settings/states.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsPasswordWidget extends StatefulWidget {
  const MedicaminaDashSettingsPasswordWidget({super.key});

  @override
  State<MedicaminaDashSettingsPasswordWidget> createState() => _MedicaminaDashSettingsPasswordWidgetState();
}

class _MedicaminaDashSettingsPasswordWidgetState extends State<MedicaminaDashSettingsPasswordWidget> {
  final _passwordFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: SettingsList(
        platform: DevicePlatform.iOS,
        darkTheme: SettingsThemeData(
          settingsListBackground: Color.fromARGB(255, 48, 48, 48),
          settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
        ),
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    obscureText: true,
                    initialValue: _password,
                    validator: (value) {
                      if (value!.length >= 6) {
                        return null;
                      }
                      return 'Please enter a valid password';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration.collapsed(hintText: 'Password'),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (_password == value) {
                        return null;
                      }
                      return 'Please verify your password';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration.collapsed(hintText: 'Verify password'),
                  ),
                ),
                description: Text('Password'),
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
                        onPressed: _submitting ? null : () {
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
                                if (_passwordFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      // 'firstName': _firstName,
                                      // 'middleName': _middleName,
                                      // 'lastName': _lastName,
                                      // 'dob': _dob?.toIso8601String(),
                                      // 'gender': _gender,
                                      // 'birthCountry': _birthCountry,
                                      // 'birthState': _birthState,
                                      // 'birthCity': _birthCity,
                                    }),
                                  )
                                      .then(
                                    (response) {
                                      setState(() {
                                        _submitting = false;
                                      });
                                      Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                      Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
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
      ),
    );
  }
}