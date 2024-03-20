import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPhysicianCreateWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhysicianCreateWidget({super.key});

  @override
  State<MedicaminaDashSettingsPhysicianCreateWidget> createState() => _MedicaminaDashSettingsPhysicianCreateWidgetState();
}

class _MedicaminaDashSettingsPhysicianCreateWidgetState extends State<MedicaminaDashSettingsPhysicianCreateWidget> {
  TextEditingController? _nameController;
  String _name = '';
  String? _speciality;
  bool _submitting = false;
  final dio = Dio();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SettingsList(
        platform: DevicePlatform.iOS,
        darkTheme: const SettingsThemeData(
          settingsListBackground: Color.fromARGB(255, 48, 48, 48),
          settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
        ),
        sections: [
          SettingsSection(
            title: Text('Create physician account'),
            tiles: [
              // SettingsTile(
              //   description: Text('Physician name'),
              //   title: Padding(
              //     padding: EdgeInsets.symmetric(vertical: 4),
              //     child: TextFormField(
              //       controller: _nameController,
              //       validator: ((value) {
              //         if (value == null || value.isEmpty) {
              //           return 'Please enter a name';
              //         }
              //         return null;
              //       }),
              //       onChanged: (value) {
              //         setState(() {
              //           _name = value;
              //         });
              //       },
              //       decoration: InputDecoration.collapsed(hintText: 'Name'),
              //     ),
              //   ),
              // ),
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
                      value: _speciality,
                      onChanged: (String? value) {
                        setState(() {
                          _speciality = value;
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
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/physician/create' : 'http://localhost:8080/dash/settings/physician/create';
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
                                      // 'name': _name,
                                      'speciality': _speciality,
                                    },
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
