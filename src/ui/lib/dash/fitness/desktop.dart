import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicamina/dash/fitness/heart/widget.dart';
import 'package:medicamina/dash/fitness/record/widget.dart';
import 'package:medicamina/dash/fitness/steps/widget.dart';

class MedicaminaDashFitnessDesktopWidget extends StatelessWidget {
  const MedicaminaDashFitnessDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: MedicaminaDashFitnessStepsWidget()),
              Expanded(child: MedicaminaDashFitnessHeartWidget()),
            ],
          ),
          Row(children: [Expanded(child: MedicaminaDashFitnessRecordWidget())]),
        ],
      ),
    );
  }
}
