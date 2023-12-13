import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/fitness/desktop.dart';
import 'package:medicamina_ui/dash/fitness/mobile.dart';

class MedicaminaDashFitnessWidget extends StatefulWidget {
  const MedicaminaDashFitnessWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashFitnessWidget> createState() =>
      _MedicaminaDashFitnessWidget();
}

class _MedicaminaDashFitnessWidget extends State<MedicaminaDashFitnessWidget> {
  @override
  Widget build(BuildContext context) {
    if (630 >= MediaQuery.of(context).size.width) {
      return const Scaffold(body: MedicaminaDashFitnessMobileWidget());
    }
    return const Scaffold(body: MedicaminaDashFitnessDesktopWidget());
  }
}
