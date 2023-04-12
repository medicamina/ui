import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MedicaminsaDashEdictsDesktopWidget extends StatefulWidget {
  const MedicaminsaDashEdictsDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminsaDashEdictsDesktopWidget> createState() => _MedicaminsaDashEdictsDesktopWidget();
}

class _MedicaminsaDashEdictsDesktopWidget extends State<MedicaminsaDashEdictsDesktopWidget> {
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
                  const ListTile(
                    title: Text('Medications', style: TextStyle(fontWeight: FontWeight.bold)),
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
                                const Text('10am'),
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
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(elevation: 0),
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
                    title: Text('History', style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
