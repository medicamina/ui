import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/home/map/widget.dart';
import 'package:medicamina_ui/dash/home/personal/widget.dart';
import 'package:medicamina_ui/dash/home/table/widget.dart';

class MedicaminaDashHomeMobileWidget extends StatelessWidget {
  const MedicaminaDashHomeMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              height: 440,
              child: Row(
                children: const [Expanded(child: MedicaminaDashHomeMapWidget())],
              ),
            ),
            SizedBox(
              height: kIsWeb ? 440 : 496,
              child: Row(
                children: const [Expanded(child: MedicaminaDashHomePersonalWidget())],
              ),
            ),
            const MedicaminaDashHomeTableWidget(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
