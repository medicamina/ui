import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyMyerBriggsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   width: 380,
        //   child:
        ListTile(
          title: Row(
            children: [
              Text(
                'Myer-Briggs',
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
                            Icon(CommunityMaterialIcons.clipboard_list_outline))
                  ],
                ),
              ),
            ],
          ),
          // ),
        ),
        Container(
          height: 616,
          // width: MediaQuery.of(context).size.width > 1024 ? 380 : null,
          child: Card(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Image.asset(
                      'assets/images/campaigner.jpg',
                    ),
                  ),
                ),
                // Material(
                //   color: Colors.transparent,
                //   child: InkWell(
                //     hoverColor: Color.fromRGBO(250, 250, 250, 0.2),
                //     onTap: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
