import 'package:flutter/widgets.dart';
import 'package:medicamina/dash/appointment/next/widget.dart';

class MedicaminaDashAppointmentMobileWidget extends StatelessWidget {
  const MedicaminaDashAppointmentMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: MedicaminaDashAppointmentNextWidget(),
      ),
    );
  }
}