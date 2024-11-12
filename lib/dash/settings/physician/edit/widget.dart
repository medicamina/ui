import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:numberpicker/numberpicker.dart';

class MedicaminaDashSettingsPhysicianClinicEditWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhysicianClinicEditWidget({super.key, required this.clinic});
  final clinic;

  @override
  State<MedicaminaDashSettingsPhysicianClinicEditWidget> createState() => _MedicaminaDashSettingsPhysicianClinicEditWidgetState();
}

class _MedicaminaDashSettingsPhysicianClinicEditWidgetState extends State<MedicaminaDashSettingsPhysicianClinicEditWidget> {
  bool _submitting = false;
  final dio = Dio();
  // final _formKey = GlobalKey<FormState>();
  var clinicHours;
  var doctorHours;
  int _currentIntValue = 30;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.clinic['hours'].length; i++) {
      if (widget.clinic['hours'][i]['doctorId'] == null) {
        setState(() {
          clinicHours = widget.clinic['hours'][i];
        });
      }
      if (widget.clinic['hours'][i]['doctorId'] != null) {
        setState(() {
          doctorHours = widget.clinic['hours'][i];
          sundayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['sundayOpen']).toLocal());
          sundayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['sundayClose']).toLocal());
          sundayOperating = widget.clinic['hours'][i]['sundayOperating'];
          mondayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['mondayOpen']).toLocal());
          mondayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['mondayClose']).toLocal());
          mondayOperating = widget.clinic['hours'][i]['mondayOperating'];
          tuesdayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['tuesdayOpen']).toLocal());
          tuesdayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['tuesdayClose']).toLocal());
          tuesdayOperating = widget.clinic['hours'][i]['tuesdayOperating'];
          wednesdayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['wednesdayOpen']).toLocal());
          wednesdayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['wednesdayClose']).toLocal());
          wednesdayOperating = widget.clinic['hours'][i]['wednesdayOperating'];
          thursdayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['thursdayOpen']).toLocal());
          thursdayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['thursdayClose']).toLocal());
          thursdayOperating = widget.clinic['hours'][i]['thursdayOperating'];
          fridayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['fridayOpen']).toLocal());
          fridayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['fridayClose']).toLocal());
          fridayOperating = widget.clinic['hours'][i]['fridayOperating'];
          saturdayOpen = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['saturdayOpen']).toLocal());
          saturdayClose = TimeOfDay.fromDateTime(DateTime.parse(widget.clinic['hours'][i]['saturdayClose']).toLocal());
          saturdayOperating = widget.clinic['hours'][i]['saturdayOperating'];
          _currentIntValue = widget.clinic['hours'][i]['consultLength'] ?? 15;
          callToBook = widget.clinic['hours'][i]['callToBook'] ?? false;
        });
      }
    }
  }

  String formatZero(var zero) {
    if (zero == 0) {
      return '00';
    }
    if (zero == 1) {
      return '01';
    }
    if (zero == 2) {
      return '02';
    }
    if (zero == 3) {
      return '03';
    }
    if (zero == 4) {
      return '04';
    }
    if (zero == 5) {
      return '05';
    }
    if (zero == 6) {
      return '06';
    }
    if (zero == 7) {
      return '07';
    }
    if (zero == 8) {
      return '08';
    }
    if (zero == 9) {
      return '09';
    }
    return zero.toString();
  }

  bool sundayOperating = true;
  TimeOfDay? sundayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? sundayOpenUtc;
  TimeOfDay? sundayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? sundayCloseUtc;

  bool mondayOperating = true;
  TimeOfDay? mondayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? mondayOpenUtc;
  TimeOfDay? mondayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? mondayCloseUtc;

  bool tuesdayOperating = true;
  TimeOfDay? tuesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? tuesdayOpenUtc;
  TimeOfDay? tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? tuesdayCloseUtc;

  bool wednesdayOperating = true;
  TimeOfDay? wednesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? wednesdayOpenUtc;
  TimeOfDay? wednesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? wednesdayCloseUtc;

  bool thursdayOperating = true;
  TimeOfDay? thursdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? thursdayOpenUtc;
  TimeOfDay? thursdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? thursdayCloseUtc;

  bool fridayOperating = true;
  TimeOfDay? fridayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? fridayOpenUtc;
  TimeOfDay? fridayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? fridayCloseUtc;

  bool saturdayOperating = true;
  TimeOfDay? saturdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
  TimeOfDay? saturdayOpenUtc;
  TimeOfDay? saturdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
  TimeOfDay? saturdayCloseUtc;

  bool callToBook = false;

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
          tiles: [
            SettingsTile(
              title: Text(widget.clinic['name']),
            ),
            SettingsTile(
              title: Text(widget.clinic['address']),
            ),
            SettingsTile(
              title: Text(widget.clinic['suburb']),
            ),
            SettingsTile(
              title: Text(widget.clinic['phoneNumber'] ?? 'Phone number not provided'),
            ),
          ],
        ),
        SettingsSection(
          tiles: [
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
                            var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/physician/clinic/leave' : 'http://localhost:8080/dash/settings/physician/clinic/leave';
                            var response = await dio.post(
                              url,
                              options: Options(
                                headers: {
                                  'Content-Type': 'application/json; charset=UTF-8',
                                  'authorization': await Modular.get<MedicaminaUserState>().getToken(),
                                },
                                validateStatus: (status) => true,
                              ),
                              data: {
                                'clinicId': widget.clinic['id'],
                              },
                            );
                            if (response.statusCode == 200) {
                              Navigator.popUntil(context, (route) => route.settings.name == 'home');
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
                            }
                          },
                          child: Text('LEAVE', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile(
              title: Text('Consult length', overflow: TextOverflow.ellipsis),
              trailing: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(() {
                      final newValue = _currentIntValue - 5;
                      _currentIntValue = newValue.clamp(5, 60);
                    }),
                  ),
                  NumberPicker(
                    itemWidth: 50,
                    axis: Axis.horizontal,
                    value: _currentIntValue,
                    minValue: 5,
                    maxValue: 60,
                    step: 5,
                    haptics: true,
                    onChanged: (value) => setState(() => _currentIntValue = value),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() {
                      final newValue = _currentIntValue + 5;
                      _currentIntValue = newValue.clamp(5, 60);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Availability at Clinic'),
          tiles: [
            SettingsTile.switchTile(
              title: Text('Available via phone call booking only'),
              initialValue: callToBook,
              onToggle: (bool value) {
                setState(() {
                  callToBook = value;
                });
                if (value == true) {
                  setState(() {
                    sundayOperating = false;
                    mondayOperating = false;
                    tuesdayOperating = false;
                    wednesdayOperating = false;
                    thursdayOperating = false;
                    fridayOperating = false;
                    saturdayOperating = false;
                  });
                } else {
                  setState(() {
                    sundayOperating = doctorHours['sundayOperating'];
                    mondayOperating = doctorHours['mondayOperating'];
                    tuesdayOperating = doctorHours['tuesdayOperating'];
                    wednesdayOperating = doctorHours['wednesdayOperating'];
                    thursdayOperating = doctorHours['thursdayOperating'];
                    fridayOperating = doctorHours['fridayOperating'];
                    saturdayOperating = doctorHours['saturdayOperating'];
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Sunday'),
              enabled: !callToBook,
              initialValue: sundayOperating,
              onToggle: (bool value) {
                setState(() {
                  sundayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: sundayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayOpen']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayOpen']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${sundayOpen!.hour}:${formatZero(sundayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, sundayClose!.hour, sundayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      sundayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var sundayOpenDate = DateTime(2000, 1, 1, sundayOpen!.hour, sundayOpen!.minute);
                      sundayOpenDate = sundayOpenDate.toUtc();
                      sundayOpenUtc = TimeOfDay.fromDateTime(sundayOpenDate);
                      sundayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var sundayCloseDate = DateTime(2000, 1, 1, sundayClose!.hour, sundayClose!.minute);
                      sundayCloseDate = sundayCloseDate.toUtc();
                      sundayCloseUtc = TimeOfDay.fromDateTime(sundayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    sundayOpen = result;
                  });
                  var sundayOpenDate = DateTime(2000, 1, 1, sundayOpen!.hour, sundayOpen!.minute);
                  sundayOpenDate = sundayOpenDate.toUtc();
                  setState(() {
                    sundayOpenUtc = TimeOfDay.fromDateTime(sundayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: sundayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${sundayClose!.hour}:${formatZero(sundayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, sundayOpen!.hour, sundayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      sundayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var sundayOpenDate = DateTime(2000, 1, 1, sundayOpen!.hour, sundayOpen!.minute);
                      sundayOpenDate = sundayOpenDate.toUtc();
                      sundayOpenUtc = TimeOfDay.fromDateTime(sundayOpenDate);
                      sundayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var sundayCloseDate = DateTime(2000, 1, 1, sundayClose!.hour, sundayClose!.minute);
                      sundayCloseDate = sundayCloseDate.toUtc();
                      sundayCloseUtc = TimeOfDay.fromDateTime(sundayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    sundayClose = result;
                  });
                  var sundayCloseDate = DateTime(2000, 1, 1, sundayClose!.hour, sundayClose!.minute);
                  sundayCloseDate = sundayCloseDate.toUtc();
                  setState(() {
                    sundayCloseUtc = TimeOfDay.fromDateTime(sundayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Monday'),
              initialValue: mondayOperating,
              enabled: !callToBook,
              onToggle: (bool value) {
                setState(() {
                  mondayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: mondayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['mondayOpen']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['mondayOpen']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${mondayOpen!.hour}:${formatZero(mondayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, mondayClose!.hour, mondayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      mondayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var mondayOpenDate = DateTime(2000, 1, 1, mondayOpen!.hour, mondayOpen!.minute);
                      mondayOpenDate = mondayOpenDate.toUtc();
                      mondayOpenUtc = TimeOfDay.fromDateTime(mondayOpenDate);
                      mondayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var mondayCloseDate = DateTime(2000, 1, 1, mondayClose!.hour, mondayClose!.minute);
                      mondayCloseDate = mondayCloseDate.toUtc();
                      mondayCloseUtc = TimeOfDay.fromDateTime(mondayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    mondayOpen = result;
                  });
                  var mondayOpenDate = DateTime(2000, 1, 1, mondayOpen!.hour, mondayOpen!.minute);
                  mondayOpenDate = mondayOpenDate.toUtc();
                  setState(() {
                    mondayOpenUtc = TimeOfDay.fromDateTime(mondayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: mondayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['mondayClose']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${mondayClose!.hour}:${formatZero(mondayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, mondayOpen!.hour, mondayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      mondayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var mondayOpenDate = DateTime(2000, 1, 1, mondayOpen!.hour, mondayOpen!.minute);
                      mondayOpenDate = mondayOpenDate.toUtc();
                      mondayOpenUtc = TimeOfDay.fromDateTime(mondayOpenDate);
                      mondayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var mondayCloseDate = DateTime(2000, 1, 1, mondayClose!.hour, mondayClose!.minute);
                      mondayCloseDate = mondayCloseDate.toUtc();
                      mondayCloseUtc = TimeOfDay.fromDateTime(mondayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    mondayClose = result;
                  });
                  var mondayCloseDate = DateTime(2000, 1, 1, mondayClose!.hour, mondayClose!.minute);
                  mondayCloseDate = mondayCloseDate.toUtc();
                  setState(() {
                    mondayCloseUtc = TimeOfDay.fromDateTime(mondayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Tuesday'),
              enabled: !callToBook,
              initialValue: tuesdayOperating,
              onToggle: (value) {
                setState(() {
                  tuesdayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: tuesdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['tuesdayOpen']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['tuesdayOpen']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${tuesdayOpen!.hour}:${formatZero(tuesdayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, tuesdayClose!.hour, tuesdayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      tuesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var tuesdayOpenDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                      tuesdayOpenDate = tuesdayOpenDate.toUtc();
                      tuesdayOpenUtc = TimeOfDay.fromDateTime(tuesdayOpenDate);
                      tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var tuesdayCloseDate = DateTime(2000, 1, 1, tuesdayClose!.hour, tuesdayClose!.minute);
                      tuesdayCloseDate = tuesdayCloseDate.toUtc();
                      tuesdayCloseUtc = TimeOfDay.fromDateTime(tuesdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    tuesdayOpen = result;
                  });
                  var tuesdayOpenDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                  tuesdayOpenDate = tuesdayOpenDate.toUtc();
                  setState(() {
                    tuesdayOpenUtc = TimeOfDay.fromDateTime(tuesdayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: tuesdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['tuesdayClose']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${tuesdayClose!.hour}:${formatZero(tuesdayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, tuesdayOpen!.hour, tuesdayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      tuesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var tuesdayOpenDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                      tuesdayOpenDate = tuesdayOpenDate.toUtc();
                      tuesdayOpenUtc = TimeOfDay.fromDateTime(tuesdayOpenDate);
                      tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var tuesdayCloseDate = DateTime(2000, 1, 1, tuesdayClose!.hour, tuesdayClose!.minute);
                      tuesdayCloseDate = tuesdayCloseDate.toUtc();
                      tuesdayCloseUtc = TimeOfDay.fromDateTime(tuesdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    tuesdayClose = result;
                  });
                  var tuesdayCloseDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                  tuesdayCloseDate = tuesdayCloseDate.toUtc();
                  setState(() {
                    tuesdayCloseUtc = TimeOfDay.fromDateTime(tuesdayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Wednesday'),
              enabled: !callToBook,
              initialValue: wednesdayOperating,
              onToggle: (value) {
                setState(() {
                  wednesdayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: wednesdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['wednesdayOpen']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['wednesdayOpen']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${wednesdayOpen!.hour}:${formatZero(wednesdayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, wednesdayClose!.hour, wednesdayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      wednesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var wednesdayOpenDate = DateTime(2000, 1, 1, wednesdayOpen!.hour, wednesdayOpen!.minute);
                      wednesdayOpenDate = wednesdayOpenDate.toUtc();
                      wednesdayOpenUtc = TimeOfDay.fromDateTime(wednesdayOpenDate);
                      wednesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var wednesdayCloseDate = DateTime(2000, 1, 1, wednesdayClose!.hour, wednesdayClose!.minute);
                      wednesdayCloseDate = wednesdayCloseDate.toUtc();
                      wednesdayCloseUtc = TimeOfDay.fromDateTime(wednesdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    wednesdayOpen = result;
                  });
                  var wednesdayOpenDate = DateTime(2000, 1, 1, wednesdayOpen!.hour, wednesdayOpen!.minute);
                  wednesdayOpenDate = wednesdayOpenDate.toUtc();
                  setState(() {
                    wednesdayOpenUtc = TimeOfDay.fromDateTime(wednesdayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: wednesdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['wednesdayClose']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${wednesdayClose!.hour}:${formatZero(wednesdayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, wednesdayOpen!.hour, wednesdayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      wednesdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var wednesdayOpenDate = DateTime(2000, 1, 1, wednesdayOpen!.hour, wednesdayOpen!.minute);
                      wednesdayOpenDate = wednesdayOpenDate.toUtc();
                      wednesdayOpenUtc = TimeOfDay.fromDateTime(wednesdayOpenDate);
                      wednesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var wednesdayCloseDate = DateTime(2000, 1, 1, wednesdayClose!.hour, wednesdayClose!.minute);
                      wednesdayCloseDate = wednesdayCloseDate.toUtc();
                      wednesdayCloseUtc = TimeOfDay.fromDateTime(wednesdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    wednesdayClose = result;
                  });
                  var wednesdayCloseDate = DateTime(2000, 1, 1, wednesdayClose!.hour, wednesdayClose!.minute);
                  wednesdayCloseDate = wednesdayCloseDate.toUtc();
                  setState(() {
                    wednesdayCloseUtc = TimeOfDay.fromDateTime(wednesdayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Thursday'),
              enabled: !callToBook,
              initialValue: thursdayOperating,
              onToggle: (value) {
                setState(() {
                  thursdayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: thursdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['thursdayOpen']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['thursdayOpen']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${thursdayOpen!.hour}:${formatZero(thursdayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, thursdayClose!.hour, thursdayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      thursdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var thursdayOpenDate = DateTime(2000, 1, 1, thursdayOpen!.hour, thursdayOpen!.minute);
                      thursdayOpenDate = thursdayOpenDate.toUtc();
                      thursdayOpenUtc = TimeOfDay.fromDateTime(thursdayOpenDate);
                      thursdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var thursdayCloseDate = DateTime(2000, 1, 1, thursdayClose!.hour, thursdayClose!.minute);
                      thursdayCloseDate = thursdayCloseDate.toUtc();
                      thursdayCloseUtc = TimeOfDay.fromDateTime(thursdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    thursdayOpen = result;
                  });
                  var thursdayOpenDate = DateTime(2000, 1, 1, thursdayOpen!.hour, thursdayOpen!.minute);
                  thursdayOpenDate = thursdayOpenDate.toUtc();
                  setState(() {
                    thursdayOpenUtc = TimeOfDay.fromDateTime(thursdayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: thursdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['thursdayClose']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${thursdayClose!.hour}:${formatZero(thursdayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, thursdayOpen!.hour, thursdayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      thursdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var thursdayOpenDate = DateTime(2000, 1, 1, thursdayOpen!.hour, thursdayOpen!.minute);
                      thursdayOpenDate = thursdayOpenDate.toUtc();
                      thursdayOpenUtc = TimeOfDay.fromDateTime(thursdayOpenDate);
                      thursdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var thursdayCloseDate = DateTime(2000, 1, 1, thursdayClose!.hour, thursdayClose!.minute);
                      thursdayCloseDate = thursdayCloseDate.toUtc();
                      thursdayCloseUtc = TimeOfDay.fromDateTime(thursdayCloseDate);
                    });
                    return;
                  }
                  setState(() {
                    thursdayClose = result;
                  });
                  var thursdayCloseDate = DateTime(2000, 1, 1, thursdayClose!.hour, thursdayClose!.minute);
                  thursdayCloseDate = thursdayCloseDate.toUtc();
                  setState(() {
                    thursdayCloseUtc = TimeOfDay.fromDateTime(thursdayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Friday'),
              enabled: !callToBook,
              initialValue: fridayOperating,
              onToggle: (value) {
                setState(() {
                  fridayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: fridayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['fridayOpen']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['fridayOpen']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${fridayOpen!.hour}:${formatZero(fridayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, fridayClose!.hour, fridayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      fridayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var fridayOpenDate = DateTime(2000, 1, 1, fridayOpen!.hour, fridayOpen!.minute);
                      fridayOpenDate = fridayOpenDate.toUtc();
                      fridayOpenUtc = TimeOfDay.fromDateTime(fridayOpenDate);
                      fridayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var fridayCloseDate = DateTime(2000, 1, 1, fridayClose!.hour, fridayClose!.minute);
                      fridayCloseDate = fridayCloseDate.toUtc();
                      fridayCloseUtc = TimeOfDay.fromDateTime(fridayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    fridayOpen = result;
                  });
                  var fridayOpenDate = DateTime(2000, 1, 1, fridayOpen!.hour, fridayOpen!.minute);
                  fridayOpenDate = fridayOpenDate.toUtc();
                  setState(() {
                    fridayOpenUtc = TimeOfDay.fromDateTime(fridayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: fridayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' + TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() + ':' + formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['fridayClose']).toLocal()).minute) + ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${fridayClose!.hour}:${formatZero(fridayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, fridayOpen!.hour, fridayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      fridayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var fridayOpenDate = DateTime(2000, 1, 1, fridayOpen!.hour, fridayOpen!.minute);
                      fridayOpenDate = fridayOpenDate.toUtc();
                      fridayOpenUtc = TimeOfDay.fromDateTime(fridayOpenDate);
                      fridayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var fridayCloseDate = DateTime(2000, 1, 1, fridayClose!.hour, fridayClose!.minute);
                      fridayCloseDate = fridayCloseDate.toUtc();
                      fridayCloseUtc = TimeOfDay.fromDateTime(fridayCloseDate);
                    });
                    return;
                  }
                  setState(() {
                    fridayClose = result;
                  });
                  var fridayCloseDate = DateTime(2000, 1, 1, fridayClose!.hour, fridayClose!.minute);
                  fridayCloseDate = fridayCloseDate.toUtc();
                  setState(() {
                    fridayCloseUtc = TimeOfDay.fromDateTime(fridayCloseDate);
                  });
                }
              },
            ),
          ],
        ),
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              title: Text('Saturday'),
              enabled: !callToBook,
              initialValue: saturdayOperating,
              onToggle: (value) {
                setState(() {
                  saturdayOperating = value;
                });
              },
            ),
            SettingsTile.navigation(
              enabled: saturdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'Start (Open ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['saturdayOpen']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['saturdayOpen']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${saturdayOpen!.hour}:${formatZero(saturdayOpen!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var closeDate = DateTime(2000, 0, 0, saturdayClose!.hour, saturdayClose!.minute);
                  if (resultDate.isAfter(closeDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      saturdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var saturdayOpenDate = DateTime(2000, 1, 1, saturdayOpen!.hour, saturdayOpen!.minute);
                      saturdayOpenDate = saturdayOpenDate.toUtc();
                      saturdayOpenUtc = TimeOfDay.fromDateTime(saturdayOpenDate);
                      saturdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var saturdayCloseDate = DateTime(2000, 1, 1, saturdayClose!.hour, saturdayClose!.minute);
                      saturdayCloseDate = saturdayCloseDate.toUtc();
                      saturdayCloseUtc = TimeOfDay.fromDateTime(saturdayCloseDate);
                    });
                    return;
                  }

                  setState(() {
                    saturdayOpen = result;
                  });
                  var saturdayOpenDate = DateTime(2000, 1, 1, saturdayOpen!.hour, saturdayOpen!.minute);
                  saturdayOpenDate = saturdayOpenDate.toUtc();
                  setState(() {
                    saturdayOpenUtc = TimeOfDay.fromDateTime(saturdayOpenDate);
                  });
                }
              },
            ),
            SettingsTile.navigation(
              enabled: saturdayOperating,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    'End (Close ' +
                        TimeOfDay.fromDateTime(DateTime.parse(clinicHours['sundayClose']).toLocal()).hour.toString() +
                        ':' +
                        formatZero(TimeOfDay.fromDateTime(DateTime.parse(clinicHours['saturdayClose']).toLocal()).minute) +
                        ')',
                    style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1))),
              ),
              trailing: Row(
                children: [
                  Text('${saturdayClose!.hour}:${formatZero(saturdayClose!.minute)}'),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 2),
                    child: Icon(
                      color: Color.fromRGBO(173, 173, 173, 1),
                      CupertinoIcons.chevron_forward,
                      size: 18 * MediaQuery.of(context).textScaleFactor,
                    ),
                  ),
                ],
              ),
              onPressed: (context) async {
                var result = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if (result != null) {
                  var resultDate = DateTime(2000, 0, 0, result!.hour, result!.minute);
                  var openDate = DateTime(2000, 0, 0, saturdayOpen!.hour, saturdayOpen!.minute);
                  if (resultDate.isBefore(openDate)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Time of opening must be before time of close."),
                        );
                      },
                    );
                    setState(() {
                      saturdayOpen = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 9, 0));
                      var saturdayOpenDate = DateTime(2000, 1, 1, saturdayOpen!.hour, saturdayOpen!.minute);
                      saturdayOpenDate = saturdayOpenDate.toUtc();
                      saturdayOpenUtc = TimeOfDay.fromDateTime(saturdayOpenDate);
                      saturdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                      var saturdayCloseDate = DateTime(2000, 1, 1, saturdayClose!.hour, saturdayClose!.minute);
                      saturdayCloseDate = saturdayCloseDate.toUtc();
                      saturdayCloseUtc = TimeOfDay.fromDateTime(saturdayCloseDate);
                    });
                    return;
                  }
                  setState(() {
                    saturdayClose = result;
                  });
                  var saturdayCloseDate = DateTime(2000, 1, 1, saturdayClose!.hour, saturdayClose!.minute);
                  saturdayCloseDate = saturdayCloseDate.toUtc();
                  setState(() {
                    saturdayCloseUtc = TimeOfDay.fromDateTime(saturdayCloseDate);
                  });
                }
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
                              // if (_formKey.currentState!.validate()) {
                              setState(() {
                                _submitting = true;
                              });

                              TimeOfDay? sundayOpenUtc;
                              var sundayOpenDate = DateTime(2000, 1, 1, sundayOpen!.hour, sundayOpen!.minute);
                              sundayOpenDate = sundayOpenDate.toUtc();
                              sundayOpenUtc = TimeOfDay.fromDateTime(sundayOpenDate);
                              TimeOfDay? sundayCloseUtc;
                              var sundayCloseDate = DateTime(2000, 1, 1, sundayClose!.hour, sundayClose!.minute);
                              sundayCloseDate = sundayCloseDate.toUtc();
                              sundayCloseUtc = TimeOfDay.fromDateTime(sundayCloseDate);

                              TimeOfDay? mondayOpenUtc;
                              var mondayOpenDate = DateTime(2000, 1, 1, mondayOpen!.hour, mondayOpen!.minute);
                              mondayOpenDate = mondayOpenDate.toUtc();
                              mondayOpenUtc = TimeOfDay.fromDateTime(mondayOpenDate);
                              TimeOfDay? mondayCloseUtc;
                              var mondayCloseDate = DateTime(2000, 1, 1, mondayClose!.hour, mondayClose!.minute);
                              mondayCloseDate = mondayCloseDate.toUtc();
                              mondayCloseUtc = TimeOfDay.fromDateTime(mondayCloseDate);

                              TimeOfDay? tuesdayOpenUtc;
                              var tuesdayOpenDate = DateTime(2000, 1, 1, tuesdayOpen!.hour, tuesdayOpen!.minute);
                              tuesdayOpenDate = tuesdayOpenDate.toUtc();
                              tuesdayOpenUtc = TimeOfDay.fromDateTime(tuesdayOpenDate);
                              TimeOfDay? tuesdayCloseUtc;
                              tuesdayClose = TimeOfDay.fromDateTime(DateTime(2000, 0, 0, 17, 0));
                              var tuesdayCloseDate = DateTime(2000, 1, 1, tuesdayClose!.hour, tuesdayClose!.minute);
                              tuesdayCloseDate = tuesdayCloseDate.toUtc();
                              tuesdayCloseUtc = TimeOfDay.fromDateTime(tuesdayCloseDate);

                              TimeOfDay? wednesdayOpenUtc;
                              var wednesdayOpenDate = DateTime(2000, 1, 1, wednesdayOpen!.hour, wednesdayOpen!.minute);
                              wednesdayOpenDate = wednesdayOpenDate.toUtc();
                              wednesdayOpenUtc = TimeOfDay.fromDateTime(wednesdayOpenDate);
                              TimeOfDay? wednesdayCloseUtc;
                              var wednesdayCloseDate = DateTime(2000, 1, 1, wednesdayClose!.hour, wednesdayClose!.minute);
                              wednesdayCloseDate = wednesdayCloseDate.toUtc();
                              wednesdayCloseUtc = TimeOfDay.fromDateTime(wednesdayCloseDate);

                              TimeOfDay? thursdayOpenUtc;
                              var thursdayOpenDate = DateTime(2000, 1, 1, thursdayOpen!.hour, thursdayOpen!.minute);
                              thursdayOpenDate = thursdayOpenDate.toUtc();
                              thursdayOpenUtc = TimeOfDay.fromDateTime(thursdayOpenDate);
                              TimeOfDay? thursdayCloseUtc;
                              var thursdayCloseDate = DateTime(2000, 1, 1, thursdayClose!.hour, thursdayClose!.minute);
                              thursdayCloseDate = thursdayCloseDate.toUtc();
                              thursdayCloseUtc = TimeOfDay.fromDateTime(thursdayCloseDate);

                              TimeOfDay? fridayOpenUtc;
                              var fridayOpenDate = DateTime(2000, 1, 1, fridayOpen!.hour, fridayOpen!.minute);
                              fridayOpenDate = fridayOpenDate.toUtc();
                              fridayOpenUtc = TimeOfDay.fromDateTime(fridayOpenDate);
                              TimeOfDay? fridayCloseUtc;
                              var fridayCloseDate = DateTime(2000, 1, 1, fridayClose!.hour, fridayClose!.minute);
                              fridayCloseDate = fridayCloseDate.toUtc();
                              fridayCloseUtc = TimeOfDay.fromDateTime(fridayCloseDate);

                              TimeOfDay? saturdayOpenUtc;
                              var saturdayOpenDate = DateTime(2000, 1, 1, saturdayOpen!.hour, saturdayOpen!.minute);
                              saturdayOpenDate = saturdayOpenDate.toUtc();
                              saturdayOpenUtc = TimeOfDay.fromDateTime(saturdayOpenDate);
                              TimeOfDay? saturdayCloseUtc;
                              var saturdayCloseDate = DateTime(2000, 1, 1, saturdayClose!.hour, saturdayClose!.minute);
                              saturdayCloseDate = saturdayCloseDate.toUtc();
                              saturdayCloseUtc = TimeOfDay.fromDateTime(saturdayCloseDate);

                              const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/physician/clinic/edit' : 'http://localhost:8080/dash/settings/physician/clinic/edit';
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
                                  'clinicId': widget.clinic['id'],
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
                                  'consultLength': _currentIntValue,
                                  'callToBook': callToBook,
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
                              // }
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
    );
  }
}
