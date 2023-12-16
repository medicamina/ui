import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyBig5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                'Big-5',
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
                        icon:
                            Icon(CommunityMaterialIcons.numeric_5_box_outline))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 388,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/big5.png',
                          height: 340,
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
