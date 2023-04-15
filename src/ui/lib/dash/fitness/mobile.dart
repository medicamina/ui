import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/dash/fitness/heart/widget.dart';
import 'package:medicamina/dash/fitness/steps/widget.dart';
import 'package:medicamina/states.dart';

import 'record/widget.dart';

class MedicaminaDashFitnessMobileWidget extends StatelessWidget {
  const MedicaminaDashFitnessMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            MedicaminaDashFitnessStepsWidget(),
            MedicaminaDashFitnessHeartWidget(),
            MedicaminaDashFitnessRecordWidget(),
          ],
        ),
      ),
    );
  }
}
