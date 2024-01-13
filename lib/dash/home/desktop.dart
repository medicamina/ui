import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/home/map/widget.dart';
import 'package:medicamina_ui/dash/home/personal/widget.dart';
import 'package:medicamina_ui/dash/home/table/widget.dart';

class MedicaminaDashHomeDesktopWidget extends StatelessWidget {
  const MedicaminaDashHomeDesktopWidget({Key? key}) : super(key: key);

  double? getCardHeight(BuildContext context) {
    if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height) {
      return 440;
    }

    if (!kIsWeb) {
      return 496;
    }
    if (kIsWeb) {
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        return 524;
      }
      if (Theme.of(context).platform == TargetPlatform.android) {
        return 524;
      }
      return 496;
    }
    return 440;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            SizedBox(
              height: getCardHeight(context),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: MedicaminaDashHomeMapWidget()),
                  Expanded(child: MedicaminaDashHomePersonalWidget()),
                ],
              ),
            ),
            MedicaminaDashHomeTableWidget(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
