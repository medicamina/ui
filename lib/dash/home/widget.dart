import 'package:flutter/material.dart';

// Medicamina
import 'package:medicamina_ui/dash/home/desktop.dart';
import 'package:medicamina_ui/dash/home/mobile.dart';

class MedicaminaDashHomeWidget extends StatelessWidget {
  const MedicaminaDashHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (900 >= MediaQuery.of(context).size.width) {
      return const Scaffold(
        body: MedicaminaDashHomeMobileWidget(),
      );
    }
    return const Scaffold(
      body: MedicaminaDashHomeDesktopWidget(),
    );
  }
}
