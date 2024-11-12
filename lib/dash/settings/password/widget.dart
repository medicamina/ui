import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPasswordWidget extends StatefulWidget {
  const MedicaminaDashSettingsPasswordWidget({super.key});

  @override
  State<MedicaminaDashSettingsPasswordWidget> createState() => _MedicaminaDashSettingsPasswordWidgetState();
}

class _MedicaminaDashSettingsPasswordWidgetState extends State<MedicaminaDashSettingsPasswordWidget> {
  final _passwordFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _password = '';
  final dio = Dio();

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
            title: Text('Change password'),
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
                            : () async {
                                if (_passwordFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/password' : 'http://localhost:8080/dash/settings/password';
                                  var response = await dio.post(
                                    url,
                                    options: Options(
                                      headers: {
                                        'Content-Type': 'application/json; charset=UTF-8',
                                        'authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
                                      },
                                      validateStatus: (status) => true,
                                    ),
                                    data: {
                                      'password': _password 
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
