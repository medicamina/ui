import 'package:flutter/material.dart';
import 'package:medicamina/dash/appointment/mobile.dart';
import 'package:medicamina/dash/appointment/next/widget.dart';

class MedicaminaDashAppointmentWidget extends StatelessWidget {
  const MedicaminaDashAppointmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (1000 >= MediaQuery.of(context).size.width) {
      return const Scaffold(body: MedicaminaDashAppointmentMobileWidget(),);
    // }
    // return const Scaffold(body: MedicaminaDashEdictsDesktopWidget(),);

    // return Scaffold(

    //   body: Center(
    //     child: Column(
    //       children: [
    //         MedicaminaDashAppointmentNextWidget(),
    //         SizedBox(height: 48),
    //         Text('Book an appointment with a doctor'),
    //         SizedBox(height: 48),
    //         CircularProgressIndicator(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
