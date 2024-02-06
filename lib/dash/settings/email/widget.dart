import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/settings/states.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsEmailWidget extends StatefulWidget {
  const MedicaminaDashSettingsEmailWidget({super.key});

  @override
  State<MedicaminaDashSettingsEmailWidget> createState() => _MedicaminaDashSettingsEmailWidgetState();
}

class _MedicaminaDashSettingsEmailWidgetState extends State<MedicaminaDashSettingsEmailWidget> {
  final _emailFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _emailAddress = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _emailFormKey,
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
                    initialValue: _emailAddress,
                    validator: (value) {
                      if (value?.isNotEmpty ?? true) {
                        final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value as String);
                        if (emailValid) {
                          return null;
                        }
                      }
                      return 'Please enter a valid email';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration.collapsed(hintText: 'Email address'),
                    onChanged: (value) {
                      setState(() {
                        _emailAddress = value;
                      });
                    },
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    validator: (value) {
                      if (_emailAddress == value) {
                        return null;
                      }
                      return 'Please verify your email';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration.collapsed(hintText: 'Verify email address'),
                  ),
                ),
                description: Text('Email address'),
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
                      child: OutlinedButton(
                        onPressed: _submitting
                            ? null
                            : () {
                                if (_emailFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  const url = kReleaseMode ? 'medicamina.azurewebsites.net' : 'localhost:8080';
                                  http
                                      .post(
                                    Uri.https(url, 'dash/settings/email'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      'newEmail': _emailAddress
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