import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/appointment/next/widget.dart';

class MedicaminaDashAppointmentWidget extends StatelessWidget {
  const MedicaminaDashAppointmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: MedicaminaDashAppointmentNextWidget(),
        ),
      ),
    );
  }
}
