import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MedicaminaDashEdictsDesktopWidget extends StatefulWidget {
  const MedicaminaDashEdictsDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsDesktopWidget> createState() => _MedicaminaDashEdictsDesktopWidget();
}

class _MedicaminaDashEdictsDesktopWidget extends State<MedicaminaDashEdictsDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Medications',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 60,
                                    child: OutlinedButton(
                                      // style: ElevatedButton.styleFrom(elevation: 0),
                                      onPressed: null,
                                      child: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  IconButton(
                                    icon: const Icon(Icons.calendar_month),
                                    onPressed: () {},
                                    // style: ElevatedButton.styleFrom(elevation: 0),
                                  ),
                                  const SizedBox(width: 6),
                                  SizedBox(
                                    width: 60,
                                    child: OutlinedButton(
                                      // style: ElevatedButton.styleFrom(elevation: 0),
                                      onPressed: () {},
                                      child: const Icon(Icons.arrow_forward),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: const [Icon(CommunityMaterialIcons.pill, size: 66)],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aspirin',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Text('10am (2mg)'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6, right: 6),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(elevation: 0),
                                  onPressed: () {},
                                  child: const Text('Taken'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6, right: 6),
                                child: TextButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    backgroundColor: Colors.red.shade300.withAlpha(20),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Missed'),
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
          ),
          Expanded(
            flex: 3,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              elevation: 0,
              child: Column(
                children: const [
                  ListTile(
                    title: Text('Doctor reports', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
