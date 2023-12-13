import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/home/map/widget.dart';
import 'package:medicamina_ui/dash/home/personal/widget.dart';
import 'package:medicamina_ui/dash/home/table/widget.dart';

class MedicaminaDashHomeDesktopWidget extends StatelessWidget {
  const MedicaminaDashHomeDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              height: kIsWeb ? 440 : 496,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(child: MedicaminaDashHomeMapWidget()),
                  Expanded(child: MedicaminaDashHomePersonalWidget()),
                ],
              ),
            ),
            Row(
              children: const [
                MedicaminaDashHomeTableWidget(),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
