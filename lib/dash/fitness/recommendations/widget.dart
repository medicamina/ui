import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashFitnessRecommendationsWidget extends StatelessWidget {
  const MedicaminaDashFitnessRecommendationsWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Record',
                  style: TextStyle(
                      fontWeight:
                          Modular.get<MedicaminaThemeState>().getDarkMode()
                              ? FontWeight.normal
                              : FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: MediaQuery.of(context).size.width >= 1000
                            ? 140
                            : MediaQuery.of(context).size.width >= 300
                                ? 90
                                : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 140,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.scale,
                                      size: MediaQuery.of(context).size.width >=
                                              1000
                                          ? 66
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? 38
                                              : 22),
                                  const SizedBox(height: 2),
                                  const Text('Weight',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: MediaQuery.of(context).size.width >= 1000
                            ? 140
                            : MediaQuery.of(context).size.width >= 300
                                ? 90
                                : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 140,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.bed,
                                      size: MediaQuery.of(context).size.width >=
                                              1000
                                          ? 66
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? 38
                                              : 22),
                                  const SizedBox(height: 2),
                                  const Text('Sleep',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: MediaQuery.of(context).size.width >= 1000
                            ? 140
                            : MediaQuery.of(context).size.width >= 300
                                ? 90
                                : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 140,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.av_timer,
                                      size: MediaQuery.of(context).size.width >=
                                              1000
                                          ? 66
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? 38
                                              : 22),
                                  const SizedBox(height: 2),
                                  const Text('Blood Pressure',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: MediaQuery.of(context).size.width >= 1000
                            ? 140
                            : MediaQuery.of(context).size.width >= 300
                                ? 90
                                : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 140,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.human_male_height,
                                      size: MediaQuery.of(context).size.width >=
                                              1000
                                          ? 66
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? 38
                                              : 22),
                                  const SizedBox(height: 2),
                                  const Text('Height',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox.square(
                        dimension: MediaQuery.of(context).size.width >= 1000
                            ? 140
                            : MediaQuery.of(context).size.width >= 300
                                ? 90
                                : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 140,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.gas_meter,
                                      size: MediaQuery.of(context).size.width >=
                                              1000
                                          ? 66
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? 38
                                              : 22),
                                  const SizedBox(height: 2),
                                  const Text('Blood Glucose',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
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
}
