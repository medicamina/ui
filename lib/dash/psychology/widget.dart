import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/psychology/desktop.dart';
import 'package:medicamina_ui/dash/psychology/mobile.dart';

class MedicaminaDashPsychologyWidget extends StatelessWidget {
  const MedicaminaDashPsychologyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 1024.0) {
      return const MedicaminaDashPsychologyMobileWidget();
    }
    return const MedicaminaDashPsychologyDesktopWidget();
  }
}
