import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaPsychologyBig5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        // SizedBox(
        //   width: 380,
        //   child:
        ListTile(
          title: Text(
            'Big-5',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                  ? FontWeight.normal
                  : FontWeight.bold,
            ),
          ),
        ),
        // ),
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
