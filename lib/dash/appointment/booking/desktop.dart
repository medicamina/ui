import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaDashAppointmentBookingDesktopWidget extends StatefulWidget {
  const MedicaminaDashAppointmentBookingDesktopWidget({Key? key})
      : super(key: key);

  @override
  State<MedicaminaDashAppointmentBookingDesktopWidget> createState() =>
      _MedicaminaDashAppointmentBookingDesktopWidgetState();
}

class _MedicaminaDashAppointmentBookingDesktopWidgetState
    extends State<MedicaminaDashAppointmentBookingDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'Book an appointment',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.apply(color: Colors.black.withAlpha(175)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Speciality, practice or physician',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Suburb, postcode or region',
                          prefixIcon: Icon(Icons.location_pin),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: OutlinedButton(
                                onPressed: () {
                                  Modular.to.navigate('/dash/appointment');
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  backgroundColor:
                                      Colors.red.shade300.withAlpha(10),
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
                                child: Text('Search'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
