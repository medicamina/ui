import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medicamina_ui/dash/settings/desktop.dart';
import 'package:medicamina_ui/dash/settings/mobile.dart';
import 'package:medicamina_ui/dash/settings/states.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:http/http.dart' as http;

class MedicaminaDashSettingsWidget extends StatefulWidget {
  const MedicaminaDashSettingsWidget({super.key});

  @override
  State<MedicaminaDashSettingsWidget> createState() => _MedicaminaDashSettingsWidgetState();
}

enum NavigationRouteStyle {
  cupertino,
  material,
}

class Navigation {
  static Future<T> navigateTo<T>({
    required BuildContext context,
    required Widget screen,
    required NavigationRouteStyle style,
  }) async {
    Route? route;
    if (style == NavigationRouteStyle.cupertino) {
      route = CupertinoPageRoute<T>(builder: (_) => screen);
    } else if (style == NavigationRouteStyle.material) {
      route = MaterialPageRoute<T>(builder: (_) => screen);
    }

    return await Navigator.push<dynamic>(context, route!);
  }
}

class MedicaminaDashSettingsPasswordWidget extends StatefulWidget {
  const MedicaminaDashSettingsPasswordWidget({super.key});

  @override
  State<MedicaminaDashSettingsPasswordWidget> createState() => _MedicaminaDashSettingsPasswordWidgetState();
}

class _MedicaminaDashSettingsPasswordWidgetState extends State<MedicaminaDashSettingsPasswordWidget> {
  final _passwordFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordFormKey,
      child: SettingsList(
              darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
        sections: [
          SettingsSection(
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
                            : () {
                                if (_passwordFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      // 'firstName': _firstName,
                                      // 'middleName': _middleName,
                                      // 'lastName': _lastName,
                                      // 'dob': _dob?.toIso8601String(),
                                      // 'gender': _gender,
                                      // 'birthCountry': _birthCountry,
                                      // 'birthState': _birthState,
                                      // 'birthCity': _birthCity,
                                    }),
                                  )
                                      .then(
                                    (response) {
                                      setState(() {
                                        _submitting = false;
                                      });
                                      Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                      Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
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

class MedicaminaDashSettingsEmailWidget extends StatefulWidget {
  const MedicaminaDashSettingsEmailWidget({super.key});

  @override
  State<MedicaminaDashSettingsEmailWidget> createState() => _MedicaminaDashSettingsEmailWidgetState();
}

class _MedicaminaDashSettingsEmailWidgetState extends State<MedicaminaDashSettingsEmailWidget> {
  final _emailFormKey = GlobalKey<FormState>();
  bool _submitting = false;
  String _emailAddress = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _emailFormKey,
      child: SettingsList(
              darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
        sections: [
          SettingsSection(
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
                            : () {
                                if (_emailFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      // 'firstName': _firstName,
                                      // 'middleName': _middleName,
                                      // 'lastName': _lastName,
                                      // 'dob': _dob?.toIso8601String(),
                                      // 'gender': _gender,
                                      // 'birthCountry': _birthCountry,
                                      // 'birthState': _birthState,
                                      // 'birthCity': _birthCity,
                                    }),
                                  )
                                      .then(
                                    (response) {
                                      setState(() {
                                        _submitting = false;
                                      });
                                      Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                      Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
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

class MedicaminaDashSettingsPersonalWidget extends StatefulWidget {
  const MedicaminaDashSettingsPersonalWidget({super.key});

  @override
  State<MedicaminaDashSettingsPersonalWidget> createState() => _MedicaminaDashSettingsPersonalWidgetState();
}

class _MedicaminaDashSettingsPersonalWidgetState extends State<MedicaminaDashSettingsPersonalWidget> {
  String? _gender = 'MALE';
  String? _dob = '';
  String? _phoneNumber = '';
  final _personalFormKey = GlobalKey<FormState>();
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personalFormKey,
      child: SettingsList(
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
                    decoration: new InputDecoration.collapsed(hintText: 'Middle Name'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
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
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth city or town';
                      }
                      return null;
                    }),
                    decoration: new InputDecoration.collapsed(hintText: 'Birth City'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth state or province';
                      }
                      return null;
                    }),
                    decoration: new InputDecoration.collapsed(hintText: 'Birth State'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter birth country';
                      }
                      return null;
                    }),
                    decoration: new InputDecoration.collapsed(hintText: 'Birth Country'),
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
                  initialValue: '',
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
                            : () {
                                if (_personalFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      // 'firstName': _firstName,
                                      // 'middleName': _middleName,
                                      // 'lastName': _lastName,
                                      // 'dob': _dob?.toIso8601String(),
                                      // 'gender': _gender,
                                      // 'birthCountry': _birthCountry,
                                      // 'birthState': _birthState,
                                      // 'birthCity': _birthCity,
                                    }),
                                  )
                                      .then(
                                    (response) {
                                      setState(() {
                                        _submitting = false;
                                      });
                                      Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                      Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
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

class MedicaminaDashSettingsPhoneWidget extends StatefulWidget {
  const MedicaminaDashSettingsPhoneWidget({super.key});

  @override
  State<MedicaminaDashSettingsPhoneWidget> createState() => _MedicaminaDashSettingsPhoneWidgetState();
}

class _MedicaminaDashSettingsPhoneWidgetState extends State<MedicaminaDashSettingsPhoneWidget> {
  bool _submitting = false;
  final _phoneFormKey = GlobalKey<FormState>();
  String? _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SettingsList(
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
                  initialValue: _phoneNumber,
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
                            : () {
                                if (_phoneFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submitting')));
                                  http
                                      .post(
                                    Uri.https('medicamina.azurewebsites.net', 'dash/settings/account'),
                                    headers: <String, String>{
                                      'Content-Type': 'application/json; charset=UTF-8',
                                      'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                    },
                                    body: jsonEncode({
                                      // 'firstName': _firstName,
                                      // 'middleName': _middleName,
                                      // 'lastName': _lastName,
                                      // 'dob': _dob?.toIso8601String(),
                                      // 'gender': _gender,
                                      // 'birthCountry': _birthCountry,
                                      // 'birthState': _birthState,
                                      // 'birthCity': _birthCity,
                                    }),
                                  )
                                      .then(
                                    (response) {
                                      setState(() {
                                        _submitting = false;
                                      });
                                      Modular.get<MedicmainaPersonalDetails>().firstName = null;
                                      Modular.get<MedicmainaPersonalDetails>().lastName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().firstName = null;
                                      Modular.get<MedicaminaDashSettingsAccountState>().lastName = null;
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

class MedicaminaDashSettingsLanguageWidget extends StatefulWidget {
  const MedicaminaDashSettingsLanguageWidget({super.key});

  @override
  State<MedicaminaDashSettingsLanguageWidget> createState() => _MedicaminaDashSettingsLanguageWidgetState();
}

class _MedicaminaDashSettingsLanguageWidgetState extends State<MedicaminaDashSettingsLanguageWidget> {
  bool _englishSelected = true;
  bool _japaneseSelected = false;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
            darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: Text('English'),
              trailing: _englishSelected ? Icon(Icons.check) : null,
              onPressed: (context) {
                setState(() {
                  _englishSelected = true;
                  _japaneseSelected = false;
                });
                print('Hello');
              },
            ),
            SettingsTile(
              title: Text('日本語'),
              trailing: _japaneseSelected ? Icon(Icons.check) : null,
              onPressed: (context) {
                setState(() {
                  _englishSelected = false;
                  _japaneseSelected = true;
                });
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(onPressed: () {}, child: Text('Submit')),
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

class MedicaminaDashSettingsNotificationsWidget extends StatefulWidget {
  const MedicaminaDashSettingsNotificationsWidget({super.key});

  @override
  State<MedicaminaDashSettingsNotificationsWidget> createState() => _MedicaminaDashSettingsNotificationsWidgetState();
}

class _MedicaminaDashSettingsNotificationsWidgetState extends State<MedicaminaDashSettingsNotificationsWidget> {
  bool _marketingEmails = false;
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
            darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _enableNotifications = value;
                });
              },
              initialValue: _enableNotifications,
              leading: Icon(Icons.notifications_active),
              title: Text('Enable notifications'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _marketingEmails = value;
                });
              },
              initialValue: _marketingEmails,
              leading: Icon(Icons.mail),
              title: Text('Enable marketing emails'),
              description: Text('Notifications'),
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
                    child: OutlinedButton(onPressed: () {}, child: Text('Submit')),
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

class _MedicaminaDashSettingsWidgetState extends State<MedicaminaDashSettingsWidget> {
  bool _darkMode = Modular.get<MedicaminaThemeState>().getDarkMode();

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      darkTheme: SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          title: Text('General'),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsLanguageWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  _darkMode = value;
                  Modular.get<MedicaminaThemeState>().setDarkMode(value);
                  Modular.get<MedicaminaThemeState>().changedState.broadcast();
                });
              },
              initialValue: _darkMode,
              leading: Icon(Icons.colorize),
              title: Text('Dark mode'),
              description: Text('App settings'),
            ),
            SettingsTile.navigation(
              title: Text('Personal details'),
              leading: Icon(CupertinoIcons.person),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPersonalWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Email'),
              leading: Icon(CupertinoIcons.mail),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsEmailWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Phone number'),
              leading: Icon(CupertinoIcons.phone),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPhoneWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Password'),
              leading: Icon(CupertinoIcons.padlock),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsPasswordWidget(), style: NavigationRouteStyle.material);
              },
            ),
            SettingsTile.navigation(
              title: Text('Sign out'),
              leading: Icon(CupertinoIcons.person_badge_minus),
              description: Text('Edit account details'),
              onPressed: (context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext _context) => AlertDialog(
                    title: const Text(
                      'Sign out?',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    content: const Text('Are you sure you want to sign out?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(_context),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Theme.of(context).buttonTheme.colorScheme?.surface),
                        onPressed: () {
                          Navigator.pop(_context, 'CONTINUE');
                          Modular.get<MedicaminaUserState>().logout();
                          Modular.to.navigate('/');
                        },
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              title: Text('Physician account'),
              leading: Icon(CupertinoIcons.heart),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              title: Text('Clinics'),
              leading: Icon(CupertinoIcons.house_alt),
              description: Text('Doctors settings'),
              onPressed: (context) {},
            ),
            SettingsTile.navigation(
              title: Text('Notifications'),
              leading: Icon(CupertinoIcons.bell),
              description: Text('Notifications'),
              onPressed: (context) {
                Navigation.navigateTo(context: context, screen: MedicaminaDashSettingsNotificationsWidget(), style: NavigationRouteStyle.material);
              },
            ),
          ],
        ),
        SettingsSection(
          title: Text('Misc'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.description),
              title: Text('Terms of Service'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.collections_bookmark),
              title: Text('Open source license'),
            ),
          ],
        ),
      ],
    );

    if (1000 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsMobileWidget();
    }
    return const MedicaminaDashSettingsDesktopWidget();
  }
}
