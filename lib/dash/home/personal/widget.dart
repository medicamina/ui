import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina/states.dart';

class MedicaminaDashHomePersonalWidget extends StatelessWidget {
  const MedicaminaDashHomePersonalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Personal details',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                  ? FontWeight.normal
                  : FontWeight.bold,
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
                      const ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Name'),
                        subtitle: Text("Jake Spencer Walklate"),
                      ),
                      const ListTile(
                        leading:
                            Icon(CommunityMaterialIcons.gender_male_female),
                        title: Text('Gender'),
                        subtitle: Text('M'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.cake),
                        title: Text('Birthdate'),
                        subtitle: Text('26 Jun 1997'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.bloodtype),
                        title: Text('Blood type'),
                        subtitle: Text('O+'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.height),
                        title: Text('Height'),
                        subtitle: Text('5"5\' [165cm]'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.scale),
                        title: Text('Weight'),
                        subtitle: Text("132lb [60kg]"),
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
