import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medicamina_ui/dash/settings/states.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsPhoneWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhoneWidget({super.key});

  @override
  State<MedicaminaDashSettingsPhoneWidget> createState() => _MedicaminaDashSettingsPhoneWidgetState();
}

class _MedicaminaDashSettingsPhoneWidgetState extends State<MedicaminaDashSettingsPhoneWidget> {
  bool _submitting = false;
  TextEditingController? _phoneNumberController;
  final _phoneFormKey = GlobalKey<FormState>();
  String? _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
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
                title: IntlPhoneField(
                  keyboardType: TextInputType.number,
                  disableAutoFillHints: true,
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  initialCountryCode: 'AU',
                  onChanged: (phone) {
                    setState(() {
                      _phoneNumber = phone.completeNumber;
                    });
                  },
                ),
                description: Text('Phone number'),
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
                                if (_phoneFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/phone-number'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      'newPhoneNumber': _phoneNumber
                                    }),
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
      ),
    );
  }
}
