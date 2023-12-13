import 'package:flutter/material.dart';

// Medicamina
// import 'package:medicamina/dash/edicts/desktop.dart';
import 'package:medicamina_ui/dash/edicts/mobile.dart';

class MedicaminaDashEdictsWidget extends StatelessWidget {
  const MedicaminaDashEdictsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (1000 >= MediaQuery.of(context).size.width) {
    return const Scaffold(
      body: MedicaminaDashEdictsMobileWidget(),
    );
    // }
    // return const Scaffold(body: MedicaminaDashEdictsDesktopWidget(),);
  }
}
