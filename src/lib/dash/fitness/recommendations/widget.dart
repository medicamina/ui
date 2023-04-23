import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina/states.dart';

class MedicaminaDashFitnessRecommendationsWidget extends StatelessWidget {
  const MedicaminaDashFitnessRecommendationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Routines',
                  style: TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
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
                        dimension: MediaQuery.of(context).size.width >= 1000 ? 120 : MediaQuery.of(context).size.width >= 300 ? 90 : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 120,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.fastfood, size: MediaQuery.of(context).size.width >= 1000 ? 66 : MediaQuery.of(context).size.width >= 300 ? 38 : 22),
                                  const SizedBox(height: 2),
                                  const Text('Nutrition', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
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
                        dimension: MediaQuery.of(context).size.width >= 1000 ? 120 : MediaQuery.of(context).size.width >= 300 ? 90 : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 120,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.bed, size: MediaQuery.of(context).size.width >= 1000 ? 66 : MediaQuery.of(context).size.width >= 300 ? 38 : 22),
                                  const SizedBox(height: 2),
                                  const Text('Sleep', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
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
                        dimension: MediaQuery.of(context).size.width >= 1000 ? 120 : MediaQuery.of(context).size.width >= 300 ? 90 : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 120,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.dumbbell, size: MediaQuery.of(context).size.width >= 1000 ? 66 : MediaQuery.of(context).size.width >= 300 ? 38 : 22),
                                  const SizedBox(height: 2),
                                  const Text('Exercises', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
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
                        dimension: MediaQuery.of(context).size.width >= 1000 ? 120 : MediaQuery.of(context).size.width >= 300 ? 90 : 68,
                        child: ClipOval(
                          child: Material(
                            child: InkWell(
                              radius: 120,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CommunityMaterialIcons.glass_mug_variant, size: MediaQuery.of(context).size.width >= 1000 ? 66 : MediaQuery.of(context).size.width >= 300 ? 38 : 22),
                                  const SizedBox(height: 2),
                                  const Text('Drugs &\nAlcohol', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
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

    // return Row(
    //   children: [
    //     Expanded(
    //       child:
    //     ),
    //   ],
    // );
  }
}
