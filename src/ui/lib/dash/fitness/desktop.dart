import 'package:flutter/material.dart';
import 'package:medicamina/dash/fitness/chart/desktop.dart';

// Medicamina
import 'package:medicamina/dash/fitness/heart/widget.dart';
import 'package:medicamina/dash/fitness/recommendations/widget.dart';
import 'package:medicamina/dash/fitness/record/widget.dart';
import 'package:medicamina/dash/fitness/steps/widget.dart';

class MedicaminaDashFitnessDesktopWidget extends StatelessWidget {
  const MedicaminaDashFitnessDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: MedicaminaDashFitnessStepsWidget()),
                Expanded(child: MedicaminaDashFitnessHeartWidget()),
              ],
            ),
            Row(children: [Flexible(child: MedicaminaDashFitnessRecordWidget())]),
            Row(
              children: [
                Flexible(
                  child: MedicaminaDashFitnessRecommendationsWidget(),
                )
              ],
            ),
            Row(
              children: [Flexible(child: MedicaminaDashFitnessActivityLineChart())],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
