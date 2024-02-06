import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:medicamina_ui/dash/states.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashHomePersonalWidget extends StatefulWidget {
  const MedicaminaDashHomePersonalWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicaminaDashHomePersonalWidget();
}

class _MedicaminaDashHomePersonalWidget extends State<MedicaminaDashHomePersonalWidget> {
  @override
  void initState() {
    super.initState();
    Modular.get<MedicmainaPersonalDetails>().emitter.subscribe((args) {
      if (!Modular.get<MedicmainaPersonalDetails>().isEmpty()) {
        updateData();
      } else {
        Modular.to.navigate('/dash/home/personal');
      }
    });

    try {
      Modular.get<MedicmainaPersonalDetails>().getData();
    } on HttpError catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.msg)));
    }
  }

  void updateData() {
    setState(() {
      firstName = Modular.get<MedicmainaPersonalDetails>().firstName;
      middleName = Modular.get<MedicmainaPersonalDetails>().middleName;
      lastName = Modular.get<MedicmainaPersonalDetails>().lastName;
      gender = Modular.get<MedicmainaPersonalDetails>().gender;
      dob = Modular.get<MedicmainaPersonalDetails>().dob;
      bloodType = Modular.get<MedicmainaPersonalDetails>().bloodType;
      height = Modular.get<MedicmainaPersonalDetails>().height as double;
      weight = Modular.get<MedicmainaPersonalDetails>().weight as double;
    });
  }

  @override
  void dispose() {
    super.dispose();
    Modular.get<MedicmainaPersonalDetails>().emitter.unsubscribeAll();
  }

  String getHeight(double height) {
    var realFeet = (height * 0.3937) / 12;
    var feet = realFeet.round();
    var inches = ((realFeet - feet) * 12).round();
    return '$feet"$inches\' [${height.round()}cm]';
  }

  String getWeight(double weight) {
    var pounds = weight * 2.2046;
    return '${pounds.round()}lbs [${weight.round()}kg]';
  }

  String? getBloodType(String? bloodType) {
    if (bloodType?.isEmpty ?? true) {
      return 'Unknown';
    }
    return bloodType;
  }

  String? getMiddleName(String? middleName) {
    if (middleName?.isEmpty ?? true) {
      return '';
    }
    return '$middleName ';
  }

  String getMonth(int? month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  DateTime? dob;
  String? bloodType;
  double height = 0;
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    if (firstName?.isEmpty ?? true) {
      return Column(
        children: [
          ListTile(
            title: Text(
              'Personal details',
              style: TextStyle(
                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              elevation: 0,
              child: const Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
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
      );
    }
    return Column(
      children: [
        ListTile(
          title: Text(
            'Personal details',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Name'),
                        subtitle: Text('$firstName ${getMiddleName(middleName)}$lastName', style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                      ListTile(
                        leading: const Icon(CommunityMaterialIcons.gender_male_female),
                        title: const Text('Gender'),
                        subtitle: Text('$gender', style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cake),
                        title: const Text('Birthdate'),
                        subtitle: Text('${dob?.day} ${getMonth(dob?.month)} ${dob?.year}', style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.bloodtype),
                        title: const Text('Blood type'),
                        subtitle: Text(getBloodType(bloodType) as String, style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.height),
                        title: const Text('Height'),
                        subtitle: Text(getHeight(height), style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                      ListTile(
                        leading: const Icon(Icons.scale),
                        title: const Text('Weight'),
                        subtitle: Text(getWeight(weight), style: TextStyle(color: const Color.fromARGB(255, 132, 132, 132))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
