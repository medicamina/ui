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
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {
                      Modular.to.navigate('/dash/appointment/booking/1');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Icon(Icons.local_hospital),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Dr Al E Gator',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Icon(Icons.arrow_forward)),
                                  ],
                                ),
                                Row(children: [Text('123 Health nut lane')]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Open 9am to 5pm'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Text('0.3km away'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 0,
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {
                      Modular.to.navigate('/dash/appointment/booking/2');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Icon(Icons.local_hospital),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Friendly Pathology',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Icon(Icons.arrow_forward)),
                                  ],
                                ),
                                Row(children: [Text('116 Health nut lane')]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Open 9am to 5pm'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Text('0.4km away'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  elevation: 0,
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {
                      Modular.to.navigate('/dash/appointment/booking/3');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Icon(Icons.local_hospital),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Dr Hugh Mungus',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Icon(Icons.arrow_forward)),
                                  ],
                                ),
                                Row(children: [Text('89 Hospital street')]),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('Open 9am to 5pm'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Text('2.5km away'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
