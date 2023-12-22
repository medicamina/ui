import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/appointment/booking/desktop.dart';
import 'package:medicamina_ui/dash/appointment/booking/mobile.dart';
// import 'package:table_calendar/table_calendar.dart';

class MedicaminaDashboardAppointmentBookingWidget extends StatefulWidget {
  const MedicaminaDashboardAppointmentBookingWidget({Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _MedicaminaDashBoardAppointmentBookingWidget();
}

class _MedicaminaDashBoardAppointmentBookingWidget
    extends State<MedicaminaDashboardAppointmentBookingWidget> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1024) {
      return MedicaminaDashAppointmentBookingMobileWidget();
      return MedicaminaDashAppointmentBookingDesktopWidget();
    }
    return MedicaminaDashAppointmentBookingMobileWidget();
  }
}
