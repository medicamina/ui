import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:open_location_picker/open_location_picker.dart';

class MedicaminaDashPersonalOnboardingWidget extends StatefulWidget {
  const MedicaminaDashPersonalOnboardingWidget({super.key});

  @override
  State<MedicaminaDashPersonalOnboardingWidget> createState() => _MedicaminaDashPersonalOnboardingWidgetState();
}

class _MedicaminaDashPersonalOnboardingWidgetState extends State<MedicaminaDashPersonalOnboardingWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _dob;
  double? _weight;
  double? _height;
  String? _gender;
  String? _birthCountry;
  String? _birthState;
  String? _birthCity;
  FormattedLocation? _location;
  final dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CoolStepper(
      config: const CoolStepperConfig(
        footerPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backText: 'BACK',
      ),
      onCompleted: () async {
        var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/home/personal' : 'http://localhost:8080/dash/home/personal';
        var response = await dio.post(
          url,
          options: Options(
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
            },
            validateStatus: (status) {
              return true;
            },
          ),
          data: {
            'firstName': _firstName,
            'middleName': _middleName,
            'lastName': _lastName,
            'dob': _dob,
            'weight': _weight,
            'height': _height,
            'gender': _gender,
            'birthCity': _birthCity,
            'birthState': _birthState,
            'birthCountry': _birthCountry,
          },
        );
        if (response.statusCode == 200) {
          Modular.get<MedicmainaPersonalDetails>().getData();
          Modular.to.navigate('/dash/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
        }
      },
      steps: <CoolStep>[
        CoolStep(
          title: 'Basic Information',
          subtitle: 'Please fill some of the basic information to get started',
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _firstName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'First name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 6),
                TextFormField(
                  initialValue: _middleName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Middle name (optional)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _middleName = value;
                    });
                  },
                  validator: (String? value) {
                    return null;
                  },
                ),
                SizedBox(height: 6),
                TextFormField(
                  initialValue: _lastName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Last name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 6),
                DateTimePicker(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 9, bottom: 0, left: 10),
                    hintText: 'Date of Birth',
                    suffixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _dob,
                  firstDate: DateTime(1910),
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
                SizedBox(height: 6),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(right: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  hint: Text('Select gender'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a gender';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                SizedBox(height: 6),
                OpenMapPicker(
                  initialValue: _location,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter a birth city';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Birth location',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (FormattedLocation? newValue) {
                    setState(() {
                      _birthCity = newValue?.address.city;
                      _birthState = newValue?.address.state;
                      _birthCountry = newValue?.address.country;
                      _location = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          validation: () {
            if (!_formKey.currentState!.validate()) {
              return 'Fill form correctly';
            }
            return null;
          },
        ),
        CoolStep(
          title: 'Weight and Height',
          subtitle: 'Please fill out your weight and height',
          content: Form(
            key: _formKeyTwo,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _weight.toString(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your weight (KG)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      try {
                        _weight = double.parse(value);
                      } catch (err) {
                        print('invalid double');
                      }
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight in kg';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 6),
                TextFormField(
                  initialValue: _height.toString(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your height (CM)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      try {
                        _height = double.parse(value);
                      } catch (err) {
                        print('Invalid double');
                      }
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height in cm';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          validation: () {
            if (!_formKeyTwo.currentState!.validate()) {
              return 'Fill form correctly';
            }
            return null;
          },
        ),
      ],
    );
  }
}
