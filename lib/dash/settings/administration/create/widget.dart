import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:medicamina_ui/states.dart';
import 'package:settings_ui/settings_ui.dart';

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
  String? _zipCode = '';
  TextEditingController? _zipCodeController;
  String? _speciality;
  final _createClinicFormKey = GlobalKey<FormState>();
  String? _businessNumber = '';
  TextEditingController? _businessNumberController;
  final dio = Dio();

  File? file;
  String status = '';
  String? base64Image;
  File? tmpFile;
  String errMessage = 'Error Uploading Image';
  // var imagePicker = ImagePicker();

  Widget showImage() {
    if (file != null) {
      return Flexible(
        child: Image.file(
          file as File,
          fit: BoxFit.fill,
        ),
      );
    }
    return SizedBox.shrink();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
    _addressController = TextEditingController(text: _address);
    _suburbController = TextEditingController(text: _suburb);
    _countryController = TextEditingController(text: _country);
    _businessNumberController = TextEditingController(text: _businessNumber);
    _zipCodeController = TextEditingController(text: _zipCode);
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
                description: Text('Clinic Photo'),
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
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
                          Row(children: [Text('Upload clinic photo')]),
                          // const SizedBox(height: 6),
                          // Row(children: [Text('Photo should be at least 300x300px')]),
                          const SizedBox(height: 12),
                          Row(
                            children: [OutlinedButton(onPressed: () {}, child: const Text('Upload a photo'))],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                description: Tooltip(
                  child: Text('Business number (ℹ️)'),
                  message: 'Example: Employer Identification Number or Australian Business Number',
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _businessNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a unique business indetifier';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _businessNumber = value;
                      });
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Unique business identifier'),
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
                        return 'Please enter a clinic city';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Clinic city'),
                  ),
                ),
              ),
              SettingsTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _zipCodeController,
                    onChanged: (value) {
                      setState(() {
                        _zipCode = value;
                      });
                    },
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a clinic zip code';
                      }
                      return null;
                    }),
                    decoration: InputDecoration.collapsed(hintText: 'Clinic zip code'),
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
                                if (_createClinicFormKey.currentState!.validate()) {
                                  setState(() {
                                    _submitting = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/clinic/create' : 'http://localhost:8080/dash/settings/clinic/create';
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
                                      'name': _name,
                                      'address': _address,
                                      'suburb': _suburb,
                                      'zipcode': _zipCode,
                                      'country': _country,
                                      'speciality': _speciality,
                                      'businessNumber': _businessNumber,
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
