import 'package:flutter/material.dart';

class MedicaminaDashAppointmentWidget extends StatelessWidget {
  const MedicaminaDashAppointmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [SizedBox(height: 48), Text('Book an appointment with a doctor'), SizedBox(height: 48), CircularProgressIndicator()],
    );
  }
}
