import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyMCMI3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   width: 380,
        //   child:
        ListTile(
          title: Text(
            'MCMI-3',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                  ? FontWeight.normal
                  : FontWeight.bold,
            ),
          ),
        ),
        // ),
        SizedBox(
          height: 180,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Book the test',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Book MCMI-3'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
