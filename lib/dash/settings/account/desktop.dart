import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:medicamina_ui/dash/settings/states.dart';
import 'package:medicamina_ui/dash/states.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashSettingsAccountDesktopWidget extends StatefulWidget {
  const MedicaminaDashSettingsAccountDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsAccountDesktopWidget> createState() => _MedicaminaDashSettingsAccountDesktopWidget();
}

class _MedicaminaDashSettingsAccountDesktopWidget extends State<MedicaminaDashSettingsAccountDesktopWidget> {
  String _firstName = '';
  TextEditingController? _firstNameController;
  String _middleName = '';
  TextEditingController? _middleNameController;
  String _lastName = '';
  TextEditingController? _lastNameController;
  DateTime? _dob;
  // TextEditingController? _dobController;
  String _phoneNumber = '';
  // TextEditingController? _phoneNumberController;
  String? _gender = '';
  String _birthCity = '';
  TextEditingController? _birthCityController;
  String _birthState = '';
  TextEditingController? _birthStateController;
  String _birthCountry = '';
  TextEditingController? _birthCountryController;
  bool _submitting = false;

  late bool _marketing = false;
  late bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    if (Modular.get<MedicaminaDashSettingsAccountState>().isEmpty()) {
      http.get(
        Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
        },
      ).then((response) {
        if (response.statusCode == 200) {
          setState(() {
            _firstName = jsonDecode(response.body)['firstName'];
            _firstNameController = TextEditingController(text: _firstName);
            Modular.get<MedicaminaDashSettingsAccountState>().firstName = _firstName;
            _middleName = jsonDecode(response.body)['middleName'];
            _middleNameController = TextEditingController(text: _middleName);
            Modular.get<MedicaminaDashSettingsAccountState>().middleName = _middleName;
            _lastName = jsonDecode(response.body)['lastName'];
            _lastNameController = TextEditingController(text: _lastName);
            Modular.get<MedicaminaDashSettingsAccountState>().lastName = _lastName;
            _dob = DateTime.parse(jsonDecode(response.body)['dob']);
            Modular.get<MedicaminaDashSettingsAccountState>().dob = _dob;
            _phoneNumber = jsonDecode(response.body)['phoneNumber'] ?? '';
            Modular.get<MedicaminaDashSettingsAccountState>().phoneNumber = _phoneNumber;
            _gender = jsonDecode(response.body)['gender'];
            Modular.get<MedicaminaDashSettingsAccountState>().gender = _gender;
            _birthCity = jsonDecode(response.body)['birthCity'];
            _birthCityController = TextEditingController(text: _birthCity);
            Modular.get<MedicaminaDashSettingsAccountState>().birthCity = _birthCity;
            _birthState = jsonDecode(response.body)['birthState'];
            _birthStateController = TextEditingController(text: _birthState);
            Modular.get<MedicaminaDashSettingsAccountState>().birthState = _birthState;
            _birthCountry = jsonDecode(response.body)['birthCountry'];
            _birthCountryController = TextEditingController(text: _birthCountry);
            Modular.get<MedicaminaDashSettingsAccountState>().birthCountry = _birthCountry;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
        }
      });
    } else {
      setState(() {
        _firstName = Modular.get<MedicaminaDashSettingsAccountState>().firstName!;
        _firstNameController = TextEditingController(text: _firstName);

        _middleName = Modular.get<MedicaminaDashSettingsAccountState>().middleName!;
        _middleNameController = TextEditingController(text: _middleName);

        _lastName = Modular.get<MedicaminaDashSettingsAccountState>().lastName!;
        _lastNameController = TextEditingController(text: _lastName);

        _dob = Modular.get<MedicaminaDashSettingsAccountState>().dob;

        _phoneNumber = Modular.get<MedicaminaDashSettingsAccountState>().phoneNumber;

        _gender = Modular.get<MedicaminaDashSettingsAccountState>().gender;

        _birthCity = Modular.get<MedicaminaDashSettingsAccountState>().birthCity;
        _birthCityController = TextEditingController(text: _birthCity);

        _birthState = Modular.get<MedicaminaDashSettingsAccountState>().birthState;
        _birthStateController = TextEditingController(text: _birthState);

        _birthCountry = Modular.get<MedicaminaDashSettingsAccountState>().birthCountry;
        _birthCountryController = TextEditingController(text: _birthCountry);
      });
    }
  }

  Color getInputLabelColor() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const Color.fromRGBO(240, 240, 240, 1);
    }
    return const Color.fromRGBO(103, 103, 103, 1);
  }

  TextStyle getInputLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: getInputLabelColor(), letterSpacing: 0.35);
    }
    return TextStyle(color: getInputLabelColor(), letterSpacing: 0.35);
  }

  TextStyle getUploadPhotoTextStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return const TextStyle(fontWeight: FontWeight.normal);
    }
    return const TextStyle(fontWeight: FontWeight.w600);
  }

  TextStyle? getUploadPhotoSubtitleStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return TextStyle(color: Theme.of(context).textTheme.bodySmall?.color);
    }
    return null;
  }

  TextStyle? getDividerLabelStyle() {
    if (Modular.get<MedicaminaThemeState>().getDarkMode()) {
      return Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 13.66,
            fontWeight: FontWeight.normal,
          );
    }
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 13.66,
          fontWeight: FontWeight.bold,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (_dob == null) {
      return CircularProgressIndicator();
    }
    return Padding(
      padding: EdgeInsets.all(6),
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profile', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                const Divider(height: 1),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'User profile picture',
                        style: getDividerLabelStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              Icon(
                                Icons.account_box,
                                size: 140,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [Text('Upload profile photo', style: getUploadPhotoTextStyle())]),
                              const SizedBox(height: 6),
                              Row(children: [Text('Photo should be at least 300x300px', style: getUploadPhotoSubtitleStyle())]),
                              const SizedBox(height: 12),
                              Row(
                                children: [OutlinedButton(onPressed: () {}, child: const Text('Upload a photo'))],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'User information',
                        style: getDividerLabelStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'First name',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              controller: _firstNameController,
                              onChanged: (value) {
                                setState(() {
                                  _firstName = value;
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.alphabetical_variant),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Middle name',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              controller: _middleNameController,
                              onChanged: (value) {
                                setState(() {
                                  _middleName = value;
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.alphabetical_variant),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Last name',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _lastName = value;
                                });
                              },
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.alphabetical_variant),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Gender',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
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
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.black38,
                                      ),
                                      // color: Colors.grey.withAlpha(50)
                                    )),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Birthdate',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: DateTimePicker(
                              initialDate: _dob,
                              initialValue: _dob?.toIso8601String(),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 9, bottom: 0, left: 10),
                                hintText: 'MMM dd, YYYY',
                                suffixIcon: Icon(Icons.date_range),
                                border: OutlineInputBorder(),
                              ),
                              firstDate: DateTime(1910),
                              useRootNavigator: true,
                              lastDate: DateTime.now(),
                              dateLabelText: 'Date',
                              onChanged: (val) {
                                setState(() {
                                  _dob = DateTime.parse(val);
                                });
                              },
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Birth country',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  _birthCountry = val;
                                });
                              },
                              controller: _birthCountryController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.map_marker),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Birth state',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  _birthState = val;
                                });
                              },
                              controller: _birthStateController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.map_marker),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Birth city',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextField(
                              onChanged: (val) {
                                setState(() {
                                  _birthCity = val;
                                });
                              },
                              controller: _birthCityController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(CommunityMaterialIcons.map_marker),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32, bottom: 16),
                            child: Text(
                              'Phone number',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 62,
                            child: IntlPhoneField(
                              initialValue: _phoneNumber,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'AU',
                              onChanged: (phone) {
                                setState(() {
                                  _phoneNumber = phone.completeNumber;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'User preferences',
                        style: getDividerLabelStyle(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Receive marketing emails',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Switch(
                              value: _marketing,
                              activeColor: Colors.red,
                              onChanged: (bool value) {
                                setState(() {
                                  _marketing = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: Text(
                              'Dark mode',
                              style: getInputLabelStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Switch(
                              value: Modular.get<MedicaminaThemeState>().getDarkMode(),
                              activeColor: Colors.red,
                              onChanged: (bool value) {
                                setState(() {
                                  _darkMode = value;
                                  Modular.get<MedicaminaThemeState>().setDarkMode(value);
                                  Modular.get<MedicaminaThemeState>().changedState.broadcast();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text('CANCEL'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red.shade300.withAlpha(20),
                        padding: const EdgeInsets.only(right: 14, left: 14),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    ElevatedButton(
                        child: const Text('SUBMIT'),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),
                          padding: const EdgeInsets.only(right: 18, left: 18),
                        ),
                        onPressed: _submitting
                            ? null
                            : () {
                                setState(() {
                                  _submitting = true;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                http
                                    .post(
                                  Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8',
                                    'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                  },
                                  body: jsonEncode({
                                    'firstName': _firstName,
                                    'middleName': _middleName,
                                    'lastName': _lastName,
                                    'dob': _dob?.toIso8601String(),
                                    'phoneNumber': _phoneNumber,
                                    'gender': _gender,
                                    'birthCountry': _birthCountry,
                                    'birthState': _birthState,
                                    'birthCity': _birthCity,
                                    'receieveMarketingEmails': _marketing
                                  }),
                                )
                                    .then((response) {
                                  setState(() {
                                    _submitting = false;
                                  });
                                  Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                  Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                  Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                  Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
                                  if (response.statusCode == 200) {
                                    Modular.to.navigate('/dash/settings');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
                                  }
                                });
                              }),
                  ],
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
