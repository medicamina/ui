import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/fitness/chart/desktop.dart';
import 'package:medicamina_ui/dash/fitness/heart/widget.dart';
import 'package:medicamina_ui/dash/fitness/recommendations/widget.dart';
import 'package:medicamina_ui/dash/fitness/steps/widget.dart';

class MedicaminaDashFitnessMobileWidget extends StatelessWidget {
  const MedicaminaDashFitnessMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            const MedicaminaDashFitnessStepsWidget(),
            const MedicaminaDashFitnessHeartWidget(),
            // const MedicaminaDashFitnessRecordWidget(),
            const MedicaminaDashFitnessRecommendationsWidget(),
            MedicaminaDashFitnessActivityLineChart(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
