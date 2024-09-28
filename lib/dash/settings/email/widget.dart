import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsEmailWidget extends StatefulWidget {
  const MedicaminaDashSettingsEmailWidget({super.key});

  @override
  State<MedicaminaDashSettingsEmailWidget> createState() => _MedicaminaDashSettingsEmailWidgetState();
}

class _MedicaminaDashSettingsEmailWidgetState extends State<MedicaminaDashSettingsEmailWidget> {
  final _emailFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _emailAddress = '';
  final dio = Dio();

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
            title: Text('Change Email address'),
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
                            : () async {
                                if (_emailFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/email' : 'http://localhost:8080/dash/settings/email';
                                  var response = await dio.post(
                                    url,
                                    options: Options(
                                      headers: {
                                        'Content-Type': 'application/json; charset=UTF-8',
                                        'Authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
                                      },
                                      validateStatus: (status) => true,
                                    ),
                                    data: {
                                      'emailAddress': _emailAddress 
                                    }
                                  );
                                  if (response.statusCode == 200) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
                                    setState(() {
                                      _submitting = false;
                                    });
                                  }
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