import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaDashAppointmentBookingMobileWidget extends StatefulWidget {
  const MedicaminaDashAppointmentBookingMobileWidget({Key? key})
      : super(key: key);

  @override
  State<MedicaminaDashAppointmentBookingMobileWidget> createState() =>
      _MedicaminaDashAppointmentBookingMobileWidgetState();
}

class _MedicaminaDashAppointmentBookingMobileWidgetState
    extends State<MedicaminaDashAppointmentBookingMobileWidget> {
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
              Padding(
                padding: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Speciality, practice or physician',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Suburb, postcode or region',
                    prefixIcon: Icon(Icons.location_pin),
                  ),
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
                            Modular.to.navigate('/dash/appointment');
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
                          child: Text('Search'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Practices',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text('Dr Al E Gator'),
                  ),
                  elevation: 0,
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text('Dr Hugh Mungus'),
                  ),
                  elevation: 0,
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text('Dr'),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
