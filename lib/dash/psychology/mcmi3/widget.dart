import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyMCMI3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                'MCMI-3',
                style: TextStyle(
                  fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CommunityMaterialIcons
                            .clipboard_text_multiple_outline))
                  ],
                ),
              ),
            ],
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
