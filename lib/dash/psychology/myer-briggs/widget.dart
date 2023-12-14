import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyMyerBriggsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 380,
          child: ListTile(
            title: Text(
              'Myer-Briggs',
              style: TextStyle(
                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 616,
          width: 380,
          child: Card(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Image.asset('assets/images/campaigner.jpg'),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    hoverColor: Color.fromRGBO(250, 250, 250, 0.2),
                    onTap: () {},
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
