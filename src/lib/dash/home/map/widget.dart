import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina/dash/home/map/choropleth_map.dart';
import 'package:medicamina/states.dart';

class MedicaminaDashHomeMapWidget extends StatelessWidget {
  const MedicaminaDashHomeMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Your ancestry',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            tooltip: 'Detailed DNA',
            icon: const Icon(Icons.fingerprint),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    elevation: 0,
                    contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
                    titlePadding: const EdgeInsets.all(0),
                    title: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16),
                        child: Text(
                          'Genetic origin',
                          style: TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
                        ),
                      ),
                    ),
                    content: SizedBox(
                      width: 340,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              dense: false,
                              title: Row(
                                children: const [
                                  Text(
                                    'European',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '99.4%',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              tileColor: const Color.fromARGB(255, 32, 83, 171),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('English'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('69%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('Irish'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('19%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('Scottish'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('9%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('Belgian'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('3%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              dense: false,
                              title: Row(
                                children: const [
                                  Text(
                                    'Australian',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '0.3%',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              tileColor: const Color.fromARGB(255, 231, 63, 51),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('Aboriginal'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('100%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              dense: false,
                              title: Row(
                                children: const [
                                  Text(
                                    'Indian',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '0.3%',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              tileColor: const Color.fromARGB(255, 129, 143, 6),
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 18, right: 18),
                              dense: true,
                              title: Row(
                                children: [
                                  const Text('East Indian'),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Text('100%'),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.3,
                              height: 0,
                              indent: 8,
                              endIndent: 8,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 6)),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'DISMISS',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 22, right: 22)),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 6)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Expanded(child: ChoroplethMap())],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
