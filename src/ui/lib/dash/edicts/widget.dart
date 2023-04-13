
import 'package:flutter/material.dart';
import 'package:medicamina/dash/edicts/desktop.dart';
import 'package:medicamina/dash/edicts/mobile.dart';

class MedicaminaDashEdictsWidget extends StatelessWidget {
  const MedicaminaDashEdictsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1300 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashEdictsMobileWidget();
    }
    return const MedicaminaDashEdictsDesktopWidget();
  }
}
