import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MedicaminaDashEdictsMobileWidget extends StatefulWidget {
  const MedicaminaDashEdictsMobileWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsMobileWidget> createState() => _MedicaminaDashEdictsMobileWidgetState();
}

class _MedicaminaDashEdictsMobileWidgetState extends State<MedicaminaDashEdictsMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
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
                                  SizedBox(
                                    width: 60,
                                    child: OutlinedButton(
                                      // style: ElevatedButton.styleFrom(elevation: 0),
                                      onPressed: null,
                                      child: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    icon: Icon(Icons.calendar_month),
                                    onPressed: () {},
                                    // style: ElevatedButton.styleFrom(elevation: 0),
                                  ),
                                  const SizedBox(width: 16),
                                  SizedBox(
                                    width: 60,
                                    child: OutlinedButton(
                                      // style: ElevatedButton.styleFrom(elevation: 0),
                                      onPressed: () {},
                                      child: Icon(Icons.arrow_forward),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [Icon(CommunityMaterialIcons.pill, size: 66)],
                            ),
                          ),
                          SizedBox(width: 12),
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
                      SizedBox(height: 6),
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
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [Text('Hello')],
          ),
        ],
      ),
    );
  }
}
