import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashPsychologyWidget extends StatelessWidget {
  const MedicaminaDashPsychologyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1024.0) {
      return Text('Mobile');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 380,
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
                                  hoverColor:
                                      Color.fromRGBO(250, 250, 250, 0.2),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: 380,
                                  //   child:
                                  ListTile(
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
                                  // ),
                                  SizedBox(
                                    height: 180,
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CommunityMaterialIcons
                                                        .brain,
                                                    size: MediaQuery.of(context)
                                                                .size
                                                                .width >=
                                                            300
                                                        ? 112
                                                        : 88,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiary,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Test results',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  Text(
                                                    '123',
                                                    style:
                                                        TextStyle(fontSize: 44),
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
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            // SizedBox(
                                            //   width: 380,
                                            //   child:
                                            ListTile(
                                              title: Text(
                                                'MMPI-2',
                                                style: TextStyle(
                                                  fontWeight: Modular.get<
                                                              MedicaminaThemeState>()
                                                          .getDarkMode()
                                                      ? FontWeight.normal
                                                      : FontWeight.bold,
                                                ),
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
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Book the test',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                    'Book MMPI-2'),
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
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            // SizedBox(
                                            //   width: 380,
                                            //   child:
                                            ListTile(
                                              title: Text(
                                                'MCMI-3',
                                                style: TextStyle(
                                                  fontWeight: Modular.get<
                                                              MedicaminaThemeState>()
                                                          .getDarkMode()
                                                      ? FontWeight.normal
                                                      : FontWeight.bold,
                                                ),
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
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Book the test',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child: Text(
                                                                    'Book MCMI-3'),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: 380,
                                  //   child:
                                  ListTile(
                                    title: Text(
                                      'Big-5',
                                      style: TextStyle(
                                        fontWeight:
                                            Modular.get<MedicaminaThemeState>()
                                                    .getDarkMode()
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
