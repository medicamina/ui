import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class BookingCalendarDemoApp extends StatefulWidget {
  const BookingCalendarDemoApp({Key? key}) : super(key: key);

  @override
  State<BookingCalendarDemoApp> createState() => _BookingCalendarDemoAppState();
}

class _BookingCalendarDemoAppState extends State<BookingCalendarDemoApp> {
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      '8:30am',
      '9am',
      '9:30am',
      '10am',
      '10:30am',
      '11am',
      '11:30am',
      '12pm',
      '12:30pm',
      '1pm',
      '1:30pm',
      '2pm',
      '2:30pm',
      '3pm',
      '3:30pm',
      '4pm',
      '4:30pm',
      '5pm',
      '5:30pm'
    ];
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            // showYears: true,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 1)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) => print(date),
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
                return Container(
                  // color: (index % 2 == 0) ? Colors.green : Colors.yellow,
                  child: Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(items[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Spacer(flex: 2),
          //       Expanded(
          //         flex: MediaQuery.of(context).size.width >= 1024 ? 1 : 6,
          //         child: ListView.builder(
          //           itemCount: items.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return ListTile(
          //               title: OutlinedButton(
          //                 style: OutlinedButton.styleFrom(elevation: 0),
          //                 onPressed: () {},
          //                 child: Text(items[index]),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //       Spacer(flex: 2),
          //     ],
          //   ),
          // ),
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
