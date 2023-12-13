import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashPsychologyWidget extends StatelessWidget {
  const MedicaminaDashPsychologyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1012.0) {
      return Text('Mobile');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 380,
                    child: ListTile(
                      title: Text(
                        'Myer-Briggs',
                        style: TextStyle(
                          fontWeight:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/campaigner.jpg',
                            height: 600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 380,
                                child: ListTile(
                                  title: Text(
                                    'IQ',
                                    style: TextStyle(
                                      fontWeight:
                                          Modular.get<MedicaminaThemeState>()
                                                  .getDarkMode()
                                              ? FontWeight.normal
                                              : FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Card(child: Text('Hello')),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 380,
                                child: ListTile(
                                  title: Text(
                                    'MMPI-2',
                                    style: TextStyle(
                                      fontWeight:
                                          Modular.get<MedicaminaThemeState>()
                                                  .getDarkMode()
                                              ? FontWeight.normal
                                              : FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Row(children: [Flexible(child: MedicaminaDashFitnessRecordWidget())]),
                    Row(
                      children: [
                        Flexible(
                          child: Text('1'),
                        )
                      ],
                    ),
                    Row(
                      children: [Flexible(child: Text('1'))],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: ListTile(
                          title: Text(
                            'Myer-Briggs',
                            style: TextStyle(
                              fontWeight: Modular.get<MedicaminaThemeState>()
                                      .getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/campaigner.jpg',
                                height: 600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('1')),
                          Expanded(child: Text('1')),
                        ],
                      ),
                      // Row(children: [Flexible(child: MedicaminaDashFitnessRecordWidget())]),
                      Row(
                        children: [
                          Flexible(
                            child: Text('1'),
                          )
                        ],
                      ),
                      Row(
                        children: [Flexible(child: Text('1'))],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Myer-Briggs',
                        style: TextStyle(
                          fontWeight:
                              Modular.get<MedicaminaThemeState>().getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: [
                            Image.asset('assets/images/campaigner.jpg',
                                height: 600),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'IQ',
                            style: TextStyle(
                              fontWeight: Modular.get<MedicaminaThemeState>()
                                      .getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Icon(CommunityMaterialIcons.brain,
                                      size: 100),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '123',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'MMPI',
                            style: TextStyle(
                              fontWeight: Modular.get<MedicaminaThemeState>()
                                      .getDarkMode()
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                              padding: EdgeInsets.all(42),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Take the test'),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Column(),
                ],
              ),
            ],
            // ),
            // ],
          ),
        ),
      ),
    );
  }
}
