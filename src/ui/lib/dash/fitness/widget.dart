import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina/dash/fitness/desktop.dart';
import 'package:medicamina/dash/fitness/mobile.dart';

class MedicaminaDashFitnessWidget extends StatefulWidget {
  const MedicaminaDashFitnessWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashFitnessWidget> createState() => _MedicaminaDashFitnessWidget();
}

class _MedicaminaDashFitnessWidget extends State<MedicaminaDashFitnessWidget> {
  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (1000 > MediaQuery.of(context).size.width) {
      widget = const MedicaminaDashFitnessMobileWidget();
    } else {
      widget = const MedicaminaDashFitnessDesktopWidget();
    }

    return widget;
  }
}
