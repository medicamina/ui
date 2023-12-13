import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/edicts/health/widget.dart';
import 'package:medicamina_ui/dash/edicts/medication/widget.dart';
import 'package:medicamina_ui/dash/edicts/reports/widget.dart';
import 'package:medicamina_ui/dash/edicts/scripts/widget.dart';

class MedicaminaDashEdictsMobileWidget extends StatefulWidget {
  const MedicaminaDashEdictsMobileWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashEdictsMobileWidget> createState() =>
      _MedicaminaDashEdictsMobileWidgetState();
}

class _MedicaminaDashEdictsMobileWidgetState
    extends State<MedicaminaDashEdictsMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MedicaminaDashEdictsMedicationWidget(),
            MedicaminaDashEdictsReportsWidget(),
            MedicaminaDashEdictsScriptsWidget(),
            MedicaminaDashEdictsHealthWidget(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
