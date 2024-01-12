
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class MedicaminaClinicAppointmentsWidget extends StatefulWidget {
  const MedicaminaClinicAppointmentsWidget({super.key});

  @override
  State<MedicaminaClinicAppointmentsWidget> createState() => _MedicaminaClinicAppointmentsWidgetState();
}

class _MedicaminaClinicAppointmentsWidgetState extends State<MedicaminaClinicAppointmentsWidget> {
  bool weekView = true;

  final event = CalendarEventData(
    title: 'Jacob Spencer Walkate',
    date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    startTime: DateTime(0, 0, 0, 6, 30),
    endTime: DateTime(0, 0, 0, 6, 45),
    color: DateTime.now().compareTo(DateTime(0, 0, 0, 6, 30)) > 0 ? Color.fromARGB(255, 66, 200, 243) : Colors.blue
  );

  @override
  Widget build(BuildContext context) {
    CalendarControllerProvider.of(context).controller.add(event);
    return WeekView(
      heightPerMinute: 2,
      startDay: WeekDays.sunday,
      showLiveTimeLineInAllDays: true,
      onEventTap: (event, date) => print(event),
      weekNumberBuilder: (firstDayOfWeek) {
        return null;
      },
    );
  }
}