import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:intl/intl.dart';
import 'package:medicamina_ui/states.dart';
import 'dart:math';
import 'package:random_date/random_date.dart';

final _random = Random();

int next(int min, int max) {
  return min + _random.nextInt(max - min);
}

class MedicaminaBookingCalendarSlot {
  late DateTime time;
  late bool isSelected;
  late bool isAvailable;

  MedicaminaBookingCalendarSlot(this.time, this.isSelected, this.isAvailable);
}

class MedicaminaDashAppointmentBookingCalendar extends StatefulWidget {
  const MedicaminaDashAppointmentBookingCalendar({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentBookingCalendar> createState() => _MedicaminaDashAppointmentBookingCalendar();
}

class _MedicaminaDashAppointmentBookingCalendar extends State<MedicaminaDashAppointmentBookingCalendar> {
  List<DateTime> unavailableDates = [for (var i = 0; i < 500; i++) RandomDate.withRange(2024, 2025).random().copyWith(hour: next(8, 17), minute: (next(1, 2) % 2) == 0 ? 30 : 0)];
  List<String> weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  // TODO: Get this from the API
  List<MedicaminaBookingCalendarSlot> items = [];

  late DateTime selectedDateTime = DateTime.now().subtract(const Duration(days: 1));

  DateTime initialDate = DateTime.now();
  final dio = Dio();
  late String doctorId;
  late String clinicId;
  var doctorData = null;

  void getDoctorData() async {
    var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/appointment/booking/$clinicId/$doctorId' : 'http://localhost:8080/dash/appointment/booking/$clinicId/$doctorId';
    var response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
        },
        validateStatus: (status) => true,
      ),
    );

    setState(() {
      doctorData = response.data;
    });

    for (var hour in doctorData['hours']) {
      if (hour['clinicId'] == clinicId) {
        if (hour['doctorId'] == doctorId) {
          if (hour['isClinic'] == false) {
            var dateNow = DateTime.now();
            String dayName = weekdays[dateNow.weekday - 1];
            switch (dayName) {
              case 'Sunday':
                {
                  var openTime = DateTime.parse(hour['sundayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['sundayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['sundayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Monday':
                {
                  var openTime = DateTime.parse(hour['mondayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['mondayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['mondayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Tuesday':
                {
                  var openTime = DateTime.parse(hour['tuesdayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['tuesdayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['tuesdayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Wednesday':
                {
                  var openTime = DateTime.parse(hour['wednesdayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['wednesdayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['wednesdayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Thursday':
                {
                  var openTime = DateTime.parse(hour['thursdayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['thursdayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['thursdayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Friday':
                {
                  var openTime = DateTime.parse(hour['fridayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['fridayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['fridayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
              case 'Saturday':
                {
                  var openTime = DateTime.parse(hour['saturdayOpen']).toLocal();
                  var closeTime = DateTime.parse(hour['saturdayClose']).toLocal();

                  var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                  var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                  var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                  var lastDate = openDate;

                  var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                  int consultLength = int.parse(hour['consultLength'].toString());

                  int numberOfIntervals = (dateDifference / consultLength).floor();

                  items = [];
                  for (var i = 0; i < numberOfIntervals; i++) {
                    if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                      break;
                    }

                    items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                    items[i].isAvailable = hour['saturdayOperating'];

                    var newDate = lastDate.add(Duration(minutes: consultLength));
                    lastDate = newDate;
                  }
                  break;
                }
            }
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    doctorId = Modular.to.path.split('/').last;
    clinicId = Modular.to.path.split('/')[Modular.to.path.split('/').length - 2];
    getDoctorData();
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
              // get the day
              var lastDate;

              if (date.day != initialDate.day || date.month != initialDate.month || date.year != initialDate.year) {
                for (var hour in doctorData['hours']) {
                  if (hour['clinicId'] == clinicId) {
                    if (hour['doctorId'] == doctorId) {
                      if (hour['isClinic'] == false) {
                        String dayName = weekdays[date.weekday - 1];
                        switch (dayName) {
                          case 'Sunday':
                            {
                              var openTime = DateTime.parse(hour['sundayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['sundayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['sundayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Monday':
                            {
                              var openTime = DateTime.parse(hour['mondayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['mondayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['mondayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Tuesday':
                            {
                              var openTime = DateTime.parse(hour['tuesdayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['tuesdayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['tuesdayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Wednesday':
                            {
                              var openTime = DateTime.parse(hour['wednesdayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['wednesdayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['wednesdayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Thursday':
                            {
                              var openTime = DateTime.parse(hour['thursdayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['thursdayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['thursdayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Friday':
                            {
                              var openTime = DateTime.parse(hour['fridayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['fridayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['fridayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                          case 'Saturday':
                            {
                              var openTime = DateTime.parse(hour['saturdayOpen']).toLocal();
                              var closeTime = DateTime.parse(hour['saturdayClose']).toLocal();

                              var commonDate = DateTime(2000, 1, 1); // Or you can use DateTime.now() if needed

                              var openDate = DateTime(commonDate.year, commonDate.month, commonDate.day, openTime.hour, openTime.minute);
                              var closeDate = DateTime(commonDate.year, commonDate.month, commonDate.day, closeTime.hour, closeTime.minute);

                              var lastDate = openDate;

                              var dateDifference = closeDate.difference(openDate).inMinutes; // positive number

                              int consultLength = int.parse(hour['consultLength'].toString());

                              int numberOfIntervals = (dateDifference / consultLength).floor();

                              items = [];
                              for (var i = 0; i < numberOfIntervals; i++) {
                                if (lastDate.isAfter(closeDate) || lastDate.isAtSameMomentAs(closeDate)) {
                                  break;
                                }

                                items.add(MedicaminaBookingCalendarSlot(DateTime(lastDate.year, lastDate.month, lastDate.day, lastDate.hour, lastDate.minute), false, true));
                                items[i].isAvailable = hour['saturdayOperating'];

                                var newDate = lastDate.add(Duration(minutes: consultLength));
                                lastDate = newDate;
                              }
                              break;
                            }
                        }
                      }
                    }
                  }
                }

                for (var i = 0; i < items.length; i++) {
                  items[i].isSelected = false;
                  if (unavailableDates.contains(items[i].time)) {
                    items[i].isAvailable = false;
                  }
                  try {
                    if (items[i].time == selectedDateTime) {
                      items[i].isSelected = true;
                    }
                  } catch (err) {
                    print(err);
                  }
                }
              }

              initialDate = date;
            }),
            leftMargin: MediaQuery.of(context).size.width * 0.35,
            monthColor: Colors.blueGrey,
            dayColor: Theme.of(context).colorScheme.primary,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) {
              return date.isAfter(DateTime.now().subtract(const Duration(days: 1)));
            },
            locale: 'en_ISO',
          ),
          SizedBox(height: 12),
          if (items.length == 0)
            Center(child: CircularProgressIndicator()),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).size.width >= 768 ? 5 : 3),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(100, 40),
                      backgroundColor: items[index].isSelected ? Theme.of(context).primaryColor.withAlpha(50) : null,
                    ),
                    onPressed: items[index].isAvailable
                        ? () {
                            for (var i = 0; i < items.length; i++) {
                              items[i].isSelected = false;
                            }
                            setState(() {
                              items[index].isSelected = !items[index].isSelected;
                              selectedDateTime = items[index].time;
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
            padding: EdgeInsets.all(12),
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
                      onPressed: !selectedDateTime.isBefore(DateTime.now()) ? () {
                        
                      } : null,
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
