import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina/states.dart';

class MedicaminaDashEdictsHealthWidget extends StatelessWidget {
  const MedicaminaDashEdictsHealthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your health',
                      style: TextStyle(
                          fontWeight:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width >= 2500
                ? 1250
                : MediaQuery.of(context).size.width >= 1250
                    ? 1200
                    : null,
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.width <= 700 ? 3 : 5,
              child: PageView(
                allowImplicitScrolling: true,
                physics: const ClampingScrollPhysics(),
                controller: PageController(
                    viewportFraction:
                        MediaQuery.of(context).size.width <= 700 ? 0.4 : 0.2),
                padEnds: false,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? 0.7
                                  : 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            color: Color.fromRGBO(225, 255, 213, 1),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onTap: () {
                                print('tapped');
                              },
                              highlightColor:
                                  Color.fromRGBO(225, 255, 213, 0.5),
                              splashColor: Color.fromRGBO(56, 192, 9, 0.5),
                              child: Center(
                                child: Icon(
                                  Icons.medication_outlined,
                                  size: 40,
                                  color: Color.fromRGBO(56, 192, 9, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Supplements',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? 0.7
                                  : 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            color: Color.fromRGBO(255, 235, 235, 1),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onTap: () {
                                print("tapped");
                              },
                              highlightColor:
                                  Color.fromRGBO(255, 235, 235, 0.5),
                              splashColor: Color.fromRGBO(251, 0, 15, 0.5),
                              child: Center(
                                child: Icon(
                                  CommunityMaterialIcons.paper_roll_outline,
                                  size: 40,
                                  color: Color.fromRGBO(251, 0, 15, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Allergies',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? 0.7
                                  : 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            color: Color.fromRGBO(231, 236, 255, 1),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onTap: () {
                                print("tapped");
                              },
                              highlightColor:
                                  Color.fromRGBO(231, 236, 255, 0.5),
                              splashColor: Color.fromRGBO(0, 108, 197, 0.5),
                              child: Center(
                                child: Icon(
                                  CommunityMaterialIcons.blender,
                                  size: 40,
                                  color: Color.fromRGBO(0, 108, 197, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Diet',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? 0.7
                                  : 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            color: Color.fromRGBO(237, 229, 255, 1),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onTap: () {
                                print("tapped");
                              },
                              highlightColor:
                                  Color.fromRGBO(237, 229, 255, 0.5),
                              splashColor: Color.fromRGBO(145, 18, 189, 0.5),
                              child: Center(
                                child: Icon(
                                  CommunityMaterialIcons.thermometer,
                                  size: 40,
                                  color: Color.fromRGBO(145, 18, 189, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Sickness',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? 0.7
                                  : 1,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            color: Color.fromRGBO(255, 239, 216, 1),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onTap: () {
                                print("tapped");
                              },
                              highlightColor:
                                  Color.fromRGBO(255, 239, 216, 0.5),
                              splashColor: Color.fromRGBO(246, 132, 53, 0.5),
                              child: Center(
                                child: Icon(
                                  CommunityMaterialIcons.bandage,
                                  size: 40,
                                  color: Color.fromRGBO(246, 132, 53, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Pain & Injury',
                        textAlign: TextAlign.center,
                      )
                    ],
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
