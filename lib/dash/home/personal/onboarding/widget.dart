import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
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
  int _index = 0;
  final _formKey = GlobalKey<FormState>();
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
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context)  {
    return CoolStepper(
      config: CoolStepperConfig(
        footerPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backText: 'BACK',
      ),
      onCompleted: () {},
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
                DropdownButtonHideUnderline(
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
                      padding: EdgeInsets.only(right: 6),
                      height: 48,
                      // width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        // color: Colors.grey.withAlpha(50)
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
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
          subtitle: 'Please fill your out weight and height',
          content: Column(
            children: [
    OpenMapPicker(
      decoration: const InputDecoration(hintText: "My location"),
      onSaved: (FormattedLocation? newValue) {
        /// save new value
      },
    ),
            ],
          ),
          validation: () {},
        ),
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We need some more information',
                  style: Theme.of(context).textTheme.displaySmall?.apply(color: Colors.black.withAlpha(175)),
                ),
                Stepper(
                  physics: const NeverScrollableScrollPhysics(),
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('Name'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('First Name')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your first name',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _firstName = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Middle Name')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your middle name',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _middleName = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        // if (value == null || value.isEmpty) {
                                        //   return 'Please enter some text';
                                        // }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Last Name')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your last name',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _lastName = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Date of Birth'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 600,
                          child: DateTimePicker(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 9, bottom: 0, left: 10),
                              hintText: 'MMM dd, YYYY',
                              suffixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(),
                            ),
                            initialValue: '',
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
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Body'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const SizedBox(
                              width: 200,
                              child: Column(
                                children: [Text('Weight (Kg)')],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your weight',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _weight = double.parse(value);
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                              child: Column(
                                children: [Text('Height (cm)')],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter your height',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _height = double.parse(value);
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                              child: Column(
                                children: [Text('Gender')],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
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
                                            width: 140,
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
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text('Birth location'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Birth city')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Birth city',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _birthCity = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Birth state')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Birth state',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _birthState = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('Birth country')],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 400,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Birth country',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _birthCountry = value;
                                        });
                                      },
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: OutlinedButton(
                    onPressed: _submitting
                        ? null
                        : () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _submitting = true;
                              });
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                              try {
                                http
                                    .post(
                                  Uri.https('medicamina.azurewebsites.net', 'dash/home/personal'),
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8',
                                    'Authorization': Modular.get<MedicaminaUserState>().getToken() as String,
                                  },
                                  body: jsonEncode({
                                    'firstName': _firstName,
                                    'middleName': _middleName,
                                    'lastName': _lastName,
                                    'dob': _dob,
                                    'height': _height,
                                    'weight': _weight,
                                    'gender': _gender,
                                    'birthCity': _birthCity,
                                    'birthState': _birthState,
                                    'birthCountry': _birthCountry
                                  }),
                                )
                                    .then((response) {
                                  if (response.statusCode == 200) {
                                    Modular.get<MedicmainaPersonalDetails>().getData();
                                    Modular.to.navigate('/dash/home');
                                  } else {
                                    setState(() {
                                      _submitting = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
                                  }
                                });
                              } catch (e, _) {
                                print(e);
                              }
                            }
                          },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
