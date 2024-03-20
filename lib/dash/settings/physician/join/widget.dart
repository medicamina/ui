
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPhysicianJoinWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhysicianJoinWidget({super.key});

  @override
  State<MedicaminaDashSettingsPhysicianJoinWidget> createState() => _MedicaminaDashSettingsPhysicianJoinWidgetState();
}

class _MedicaminaDashSettingsPhysicianJoinWidgetState extends State<MedicaminaDashSettingsPhysicianJoinWidget> {
  bool _submitting = false;
  final _joinClinicFormKey = GlobalKey<FormState>();
  String? _joinCode = '';
  final dio = Dio();

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
                            : () async {
                                if (_joinClinicFormKey.currentState!.validate()) {
                                  bool sundayOperating = true;
                                  TimeOfDay? sundayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? sundayOpenUtc;
                                  var sundayOpenDate = DateTime(2000, 1, 1, sundayOpen!.hour, sundayOpen!.minute);
                                  sundayOpenDate = sundayOpenDate.toUtc();
                                  sundayOpenUtc = TimeOfDay.fromDateTime(sundayOpenDate);
                                  TimeOfDay? sundayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? sundayCloseUtc;
                                  var sundayCloseDate = DateTime(2000, 1, 1, sundayClose!.hour, sundayClose!.minute);
                                  sundayCloseDate = sundayCloseDate.toUtc();
                                  sundayCloseUtc = TimeOfDay.fromDateTime(sundayCloseDate);

                                  bool mondayOperating = true;
                                  TimeOfDay? mondayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? mondayOpenUtc;
                                  var mondayOpenDate = DateTime(2000, 1, 1, mondayOpen!.hour, mondayOpen!.minute);
                                  mondayOpenDate = mondayOpenDate.toUtc();
                                  mondayOpenUtc = TimeOfDay.fromDateTime(mondayOpenDate);
                                  TimeOfDay? mondayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? mondayCloseUtc;
                                  var mondayCloseDate = DateTime(2000, 1, 1, mondayClose!.hour, mondayClose!.minute);
                                  mondayCloseDate = mondayCloseDate.toUtc();
                                  mondayCloseUtc = TimeOfDay.fromDateTime(mondayCloseDate);

                                  bool tuesdayOperating = true;
                                  TimeOfDay? tuesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? tuesdayOpenUtc;
                                  var tuesdayOpenDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                                  tuesdayOpenDate = tuesdayOpenDate.toUtc();
                                  tuesdayOpenUtc = TimeOfDay.fromDateTime(tuesdayOpenDate);
                                  TimeOfDay? tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? tuesdayCloseUtc;
                                  tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  var tuesdayCloseDate = DateTime(2000, 1, 1, tuesdayClose!.hour, tuesdayClose!.minute);
                                  tuesdayCloseDate = tuesdayCloseDate.toUtc();
                                  tuesdayCloseUtc = TimeOfDay.fromDateTime(tuesdayCloseDate);

                                  bool wednesdayOperating = true;
                                  TimeOfDay? wednesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? wednesdayOpenUtc;
                                  var wednesdayOpenDate = DateTime(2000, 1, 1, wednesdayOpen!.hour, wednesdayOpen!.minute);
                                  wednesdayOpenDate = wednesdayOpenDate.toUtc();
                                  wednesdayOpenUtc = TimeOfDay.fromDateTime(wednesdayOpenDate);
                                  TimeOfDay? wednesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? wednesdayCloseUtc;
                                  var wednesdayCloseDate = DateTime(2000, 1, 1, wednesdayClose!.hour, wednesdayClose!.minute);
                                  wednesdayCloseDate = wednesdayCloseDate.toUtc();
                                  wednesdayCloseUtc = TimeOfDay.fromDateTime(wednesdayCloseDate);

                                  bool thursdayOperating = true;
                                  TimeOfDay? thursdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? thursdayOpenUtc;
                                  var thursdayOpenDate = DateTime(2000, 1, 1, thursdayOpen!.hour, thursdayOpen!.minute);
                                  thursdayOpenDate = thursdayOpenDate.toUtc();
                                  thursdayOpenUtc = TimeOfDay.fromDateTime(thursdayOpenDate);
                                  TimeOfDay? thursdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? thursdayCloseUtc;
                                  var thursdayCloseDate = DateTime(2000, 1, 1, thursdayClose!.hour, thursdayClose!.minute);
                                  thursdayCloseDate = thursdayCloseDate.toUtc();
                                  thursdayCloseUtc = TimeOfDay.fromDateTime(thursdayCloseDate);

                                  bool fridayOperating = true;
                                  TimeOfDay? fridayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? fridayOpenUtc;
                                  var fridayOpenDate = DateTime(2000, 1, 1, fridayOpen!.hour, fridayOpen!.minute);
                                  fridayOpenDate = fridayOpenDate.toUtc();
                                  fridayOpenUtc = TimeOfDay.fromDateTime(fridayOpenDate);
                                  TimeOfDay? fridayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? fridayCloseUtc;
                                  var fridayCloseDate = DateTime(2000, 1, 1, fridayClose!.hour, fridayClose!.minute);
                                  fridayCloseDate = fridayCloseDate.toUtc();
                                  fridayCloseUtc = TimeOfDay.fromDateTime(fridayCloseDate);

                                  bool saturdayOperating = true;
                                  TimeOfDay? saturdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                                  TimeOfDay? saturdayOpenUtc;
                                  var saturdayOpenDate = DateTime(2000, 1, 1, saturdayOpen!.hour, saturdayOpen!.minute);
                                  saturdayOpenDate = saturdayOpenDate.toUtc();
                                  saturdayOpenUtc = TimeOfDay.fromDateTime(saturdayOpenDate);
                                  TimeOfDay? saturdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                                  TimeOfDay? saturdayCloseUtc;
                                  var saturdayCloseDate = DateTime(2000, 1, 1, saturdayClose!.hour, saturdayClose!.minute);
                                  saturdayCloseDate = saturdayCloseDate.toUtc();
                                  saturdayCloseUtc = TimeOfDay.fromDateTime(saturdayCloseDate);
                                  
                                  setState(() {
                                    _submitting = true;
                                  });
                                  const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/physician/join' : 'http://localhost:8080/dash/settings/physician/join';
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
                                      'joinCode': _joinCode,
                                      'sundayOpen': '${DateTime(2000, 1, 1, sundayOpenUtc!.hour, sundayOpenUtc!.minute).toIso8601String()}Z',
                                      'sundayClose': '${DateTime(2000, 1, 1, sundayCloseUtc!.hour, sundayCloseUtc!.minute).toIso8601String()}Z',
                                      'sundayOperating': sundayOperating,
                                      'mondayOpen': '${DateTime(2000, 1, 1, mondayOpenUtc!.hour, mondayOpenUtc!.minute).toIso8601String()}Z',
                                      'mondayClose': '${DateTime(2000, 1, 1, mondayCloseUtc!.hour, mondayCloseUtc!.minute).toIso8601String()}Z',
                                      'mondayOperating': mondayOperating,
                                      'tuesdayOpen': '${DateTime(2000, 1, 1, tuesdayOpenUtc!.hour, tuesdayOpenUtc!.minute).toIso8601String()}Z',
                                      'tuesdayClose': '${DateTime(2000, 1, 1, tuesdayCloseUtc!.hour, tuesdayCloseUtc!.minute).toIso8601String()}Z',
                                      'tuesdayOperating': tuesdayOperating,
                                      'wednesdayOpen': '${DateTime(2000, 1, 1, wednesdayOpenUtc!.hour, wednesdayOpenUtc!.minute).toIso8601String()}Z',
                                      'wednesdayClose': '${DateTime(2000, 1, 1, wednesdayCloseUtc!.hour, wednesdayCloseUtc!.minute).toIso8601String()}Z',
                                      'wednesdayOperating': wednesdayOperating,
                                      'thursdayOpen': '${DateTime(2000, 1, 1, thursdayOpenUtc!.hour, thursdayOpenUtc!.minute).toIso8601String()}Z',
                                      'thursdayClose': '${DateTime(2000, 1, 1, thursdayCloseUtc!.hour, thursdayCloseUtc!.minute).toIso8601String()}Z',
                                      'thursdayOperating': thursdayOperating,
                                      'fridayOpen': '${DateTime(2000, 1, 1, fridayOpenUtc!.hour, fridayOpenUtc!.minute).toIso8601String()}Z',
                                      'fridayClose': '${DateTime(2000, 1, 1, fridayCloseUtc!.hour, fridayCloseUtc!.minute).toIso8601String()}Z',
                                      'fridayOperating': fridayOperating,
                                      'saturdayOpen': '${DateTime(2000, 1, 1, saturdayOpenUtc!.hour, saturdayOpenUtc!.minute).toIso8601String()}Z',
                                      'saturdayClose': '${DateTime(2000, 1, 1, saturdayCloseUtc!.hour, saturdayCloseUtc!.minute).toIso8601String()}Z',
                                      'saturdayOperating': saturdayOperating,
                                    },
                                  );
                                  if (response.statusCode == 200) {
                                    Navigator.popUntil(context, (route) => route.settings.name == 'home');
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
