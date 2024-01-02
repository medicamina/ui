import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';

class MedicaminaBookingCalendarSlot {
  late DateTime time;
  late bool isSelected;
  late bool isAvailable;

  MedicaminaBookingCalendarSlot(this.time, this.isSelected, this.isAvailable);
}

class MedicaminaDashAppointmentBookingCalendar extends StatefulWidget {
  const MedicaminaDashAppointmentBookingCalendar({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentBookingCalendar> createState() =>
      _MedicaminaDashAppointmentBookingCalendar();
}

class _MedicaminaDashAppointmentBookingCalendar
    extends State<MedicaminaDashAppointmentBookingCalendar> {
  List<MedicaminaBookingCalendarSlot> items = [
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 8, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 9, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 9, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 10, 00), true, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 10, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 11, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 11, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 12, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 12, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 13, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 13, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 14, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 14, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 15, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 15, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 16, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 16, 30), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 17, 00), false, true),
    MedicaminaBookingCalendarSlot(DateTime(2023, 1, 1, 17, 30), false, true),
  ];

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarTimeline(
            // showYears: true,
            initialDate: initialDate,
            firstDate: DateTime.now().subtract(const Duration(days: 1)),
            lastDate: DateTime.now().add(const Duration(days: 180)),
            onDateSelected: (date) => setState(() {
              initialDate = date;
            }),
            leftMargin: MediaQuery.of(context).size.width * 0.35,
            monthColor: Colors.blueGrey,
            dayColor: Theme.of(context).colorScheme.primary,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) {
              return date
                  .isAfter(DateTime.now().subtract(const Duration(days: 1)));
            },
            locale: 'en_ISO',
          ),
          SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width >= 768 ? 5 : 3),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(100, 100),
                      backgroundColor: items[index].isSelected
                          ? Theme.of(context).primaryColor.withAlpha(50)
                          : null,
                    ),
                    onPressed: items[index].isAvailable
                        ? () {
                            for (var i = 0; i < items.length; i++) {
                              items[i].isSelected = false;
                            }
                            setState(() {
                              items[index].isSelected =
                                  !items[index].isSelected;
                            });
                          }
                        : null,
                    child: Text(DateFormat.jm().format(items[index].time)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.navigate('/dash/appointment/booking');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red.shade300.withAlpha(10),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Book'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
