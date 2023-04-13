import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina/dash/home/desktop.dart';
import 'package:medicamina/dash/home/mobile.dart';

class MedicaminaDashHomeWidget extends StatelessWidget {
  const MedicaminaDashHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (900 >= MediaQuery.of(context).size.width) {
      return const MedicaminaDashHomeMobileWidget();
    }
    return const MedicaminaDashHomeDesktopWidget();
  }
}
