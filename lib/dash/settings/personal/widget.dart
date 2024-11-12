import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsPersonalWidget extends StatefulWidget {
  const MedicaminaDashSettingsPersonalWidget({super.key});

  @override
  State<MedicaminaDashSettingsPersonalWidget> createState() => _MedicaminaDashSettingsPersonalWidgetState();
}

class _MedicaminaDashSettingsPersonalWidgetState extends State<MedicaminaDashSettingsPersonalWidget> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/personal' : 'http://localhost:8080/dash/settings/personal';
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
        },
        validateStatus: (status) => true,
      ),
    );
    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      setState(() {
        _firstName = jsonResponse['firstName'];
        _firstNameController = TextEditingController(text: _firstName);
        _middleName = jsonResponse['middleName'];
        _middleNameController = TextEditingController(text: _middleName);
        _lastName = jsonResponse['lastName'];
        _lastNameController = TextEditingController(text: _lastName);
        _dob = jsonResponse['dob'];
        _dobController = TextEditingController(text: _dob);
        _gender = jsonResponse['gender'];
        _birthCity = jsonResponse['birthCity'];
        _birthCityController = TextEditingController(text: _birthCity);
        _birthState = jsonResponse['birthState'];
        _birthStateController = TextEditingController(text: _birthState);
        _birthCountry = jsonResponse['birthCountry'];
        _birthCountryController = TextEditingController(text: _birthCountry);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
    }
  }

  String? _firstName = '';
  TextEditingController? _firstNameController;
  String? _middleName = '';
  TextEditingController? _middleNameController;
  String? _lastName = '';
  TextEditingController? _lastNameController;
  String? _gender = 'MALE';
  String? _dob = '';
  TextEditingController? _dobController;
  String? _birthCity = '';
  TextEditingController? _birthCityController;
  String? _birthState = '';
  TextEditingController? _birthStateController;
  String? _birthCountry = '';
  TextEditingController? _birthCountryController;
  final _personalFormKey = GlobalKey<FormState>();
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    if (_firstName?.isEmpty ?? true) {
      if (_lastName?.isEmpty ?? true) {
        return SizedBox(
          child: Center(child: CircularProgressIndicator()),
          height: 200.0,
          width: 200.0,
        );
      }
    }
    return Form(
      key: _personalFormKey,
      child: SettingsList(
        platform: DevicePlatform.iOS,
        darkTheme: SettingsThemeData(
          settingsListBackground: Color.fromARGB(255, 48, 48, 48),
          settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
        ),
        sections: [
          SettingsSection(
            title: Text('Personal details'),
            tiles: [
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    }),
                    decoration: new InputDecoration.collapsed(hintText: 'First Name'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _middleNameController,
                    decoration: new InputDecoration.collapsed(hintText: 'Middle Name'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    }),
                    decoration: new InputDecoration.collapsed(hintText: 'Last Name'),
                  ),
                ),
                description: Text('Name'),
              ),
            ],
          ),
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _birthCityController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth city or town';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Birth City'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _birthStateController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth state or province';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Birth State'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _birthCountryController,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth country';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Birth Country'),
                  ),
                ),
                description: Text('Birth location'),
              ),
            ],
          ),
          SettingsSection(
            tiles: [
              SettingsTile(
                title: DateTimePicker(
                  type: DateTimePickerType.date,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14),
                    isDense: true,
                    hintText: 'MMM dd, YYYY',
                    suffixIcon: Icon(Icons.date_range),
                    border: InputBorder.none,
                  ),
                  controller: _dobController,
                  firstDate: DateTime(1300),
                  useRootNavigator: true,
                  lastDate: DateTime.now(),
                  dateLabelText: 'Date',
                  onChanged: (val) {
                    setState(() {
                      _dob = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter a birthdate';
                    }
                    return null;
                  },
                ),
                description: Text('Birth date'),
              ),
            ],
          ),
          SettingsSection(
            tiles: [
              SettingsTile(
                description: Text('Gender'),
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select gender',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'MALE',
                          child: Text('MALE'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'FEMALE',
                          child: Text('FEMALE'),
                        ),
                      ],
                      value: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
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
                                if (_personalFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/personal' : 'http://localhost:8080/dash/settings/personal';
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
                                      'firstName': _firstName,
                                      'middleName': _middleName,
                                      'lastName': _lastName,
                                      'dob': _dob,
                                      'gender': _gender,
                                      'birthCity': _birthCity,
                                      'birthState': _birthState,
                                      'birthCountry': _birthCountry,
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
