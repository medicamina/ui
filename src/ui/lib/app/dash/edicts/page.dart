import 'package:flutter/material.dart';
import 'package:medicamina/app/dash/edicts/desktop.dart';

class MedicaminaDashEdictsPage extends StatelessWidget {
  const MedicaminaDashEdictsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1000 > MediaQuery.of(context).size.width) {
      return CircularProgressIndicator();
    }
    return const MedicaminsaDashEdictsDesktopWidget();
  }
}