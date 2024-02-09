import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

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
  final dio = Dio();

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
            title: Text('Change phone number'),
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
                            : () async {
                                if (_phoneFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/phone-number' : 'http://localhost:8080/dash/settings/phone-number';
                                  var response = await dio.post(
                                    url,
                                    options: Options(
                                      headers: {
                                        'Content-Type': 'application/json; charset=UTF-8',
                                        'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                      },
                                      validateStatus: (status) => true,
                                    ),
                                    data: {
                                      'phoneNumber': _phoneNumber 
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
