import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashFitnessHeartWidget extends StatefulWidget {
  const MedicaminaDashFitnessHeartWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashFitnessHeartWidget> createState() =>
      _MedicaminaDashFitnessHeartWidget();
}

class _MedicaminaDashFitnessHeartWidget
    extends State<MedicaminaDashFitnessHeartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Heart rate',
                    style: TextStyle(
                      fontWeight:
                          Modular.get<MedicaminaThemeState>().getDarkMode()
                              ? FontWeight.normal
                              : FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.monitor_heart_outlined))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CommunityMaterialIcons.pulse,
                          size: MediaQuery.of(context).size.width >= 300
                              ? 112
                              : 88,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hourly average',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(fontSize: 14)),
                        Text('80 bpm', style: TextStyle(fontSize: 44)),
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
