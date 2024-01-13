import 'dart:convert';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

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
    http.get(
      Uri.https('medicamina.azurewebsites.net', 'dash/home/personal'),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': Modular.get<MedicaminaUserState>().getToken() as String},
    ).then((response) {
      if (response.statusCode == 200) {
        firstName = jsonDecode(response.body)['firstName'];
        lastName = jsonDecode(response.body)['lastName'];
        gender = jsonDecode(response.body)['gender'];
        print('Check DOB');
        dob = DateTime.parse(jsonDecode(response.body)['dob']);
        bloodType = jsonDecode(response.body)['bloodType'];
        height = jsonDecode(response.body)['height'];
        weight = jsonDecode(response.body)['weight'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
      }
    });
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

  String? firstName;
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
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
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
                        subtitle: Text('$firstName $lastName'),
                      ),
                      ListTile(
                        leading: const Icon(CommunityMaterialIcons.gender_male_female),
                        title: const Text('Gender'),
                        subtitle: Text('$gender'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cake),
                        title: const Text('Birthdate'),
                        subtitle: Text('${dob?.day} ${dob?.month} ${dob?.year}'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.bloodtype),
                        title: const Text('Blood type'),
                        subtitle: Text('$bloodType'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.height),
                        title: const Text('Height'),
                        subtitle: Text(getHeight(height)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.scale),
                        title: const Text('Weight'),
                        subtitle: Text(getWeight(weight)),
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
