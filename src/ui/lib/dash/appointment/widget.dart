import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MedicaminaDashAppointmentWidget extends StatelessWidget {
  const MedicaminaDashAppointmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [SizedBox(height: 48), Text('Book an appointment with a doctor'), SizedBox(height: 48), CircularProgressIndicator()],
    );
  }
}
