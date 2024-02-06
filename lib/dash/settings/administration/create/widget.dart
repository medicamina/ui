import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsClinicCreateWidget extends StatefulWidget {
  const MedicaminaDashSettingsClinicCreateWidget({super.key});

  @override
  State<MedicaminaDashSettingsClinicCreateWidget> createState() => _MedicaminaDashSettingsClinicCreateWidgetState();
}

class _MedicaminaDashSettingsClinicCreateWidgetState extends State<MedicaminaDashSettingsClinicCreateWidget> {
  bool _submitting = false;
  String? _name = '';
  TextEditingController? _nameController;
  String? _address = '';
  TextEditingController? _addressController;
  String? _suburb = '';
  TextEditingController? _suburbController;
  String? _country = '';
  TextEditingController? _countryController;
  String? _specialty;
  final _createClinicFormKey = GlobalKey<FormState>();
  // TextEditingController? _specialtyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
    _addressController = TextEditingController(text: _address);
    _suburbController = TextEditingController(text: _suburb);
    _countryController = TextEditingController(text: _country);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _createClinicFormKey,
      child: SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
        sections: [
          SettingsSection(
            title: Text('Create clinic'),
            tiles: [
              SettingsTile(
                description: Text('Clinic name'),
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _nameController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a clinic name';
                      }
                      return null;
                    }),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Clinic name'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _addressController,
                    onChanged: (value) {
                      setState(() {
                        _address = value;
                      });
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a clinic street address';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Clinic address'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _suburbController,
                    onChanged: (value) {
                      setState(() {
                        _suburb = value;
                      });
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a clinic suburb';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Clinic suburb'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _countryController,
                    onChanged: (value) {
                      setState(() {
                        _country = value;
                      });
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the clinics country';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Clinic country'),
                  ),
                ),
                description: Text('Clinic address'),
              ),
              SettingsTile(
                description: Text('Specialty'),
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a speciality';
                        }
                        return null;
                      },
                      hint: Text(
                        'Select specialty',
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'PSYCHOLOGY',
                          child: Text('Psychology'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'PSYCHIATRY',
                          child: Text('Psychiatry'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'PATHOLOGY',
                          child: Text('Pathology'),
                        )
                      ],
                      value: _specialty,
                      onChanged: (String? value) {
                        setState(() {
                          _specialty = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 20,
                        width: double.infinity,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
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
                                if (_createClinicFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  const url = kReleaseMode ? 'medicamina.azurewebsites.net' : 'localhost:8080';
                                  http
                                      .post(
                                    Uri.https(url, 'dash/settings/clinic/create'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode(
                                      {
                                        'name': _name,
                                        'address': _address,
                                        'suburb': _suburb,
                                        'country': _country,
                                        'specialty': _specialty,
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
      ),
    );
  }
}
