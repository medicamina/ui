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
                                  bool sundayOperating = false;
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

                                  bool saturdayOperating = false;
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
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saving')));
                                  const url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/settings/clinic/create' : 'http://localhost:8080/dash/settings/clinic/create';
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
                                      'name': _name,
                                      'address': _address,
                                      'suburb': _suburb,
                                      'zipcode': _zipCode,
                                      'country': _country,
                                      'speciality': _speciality,
                                      'businessNumber': _businessNumber,
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
