import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fuzzy/data/result.dart';
import 'package:intl/intl.dart';
import 'package:medicamina_ui/states.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fuzzy/fuzzy.dart';

import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

class MedicaminaDashAppointmentBookingWidget extends StatefulWidget {
  const MedicaminaDashAppointmentBookingWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentBookingWidget> createState() => _MedicaminaDashAppointmentBookingWidget();
}

class _MedicaminaDashAppointmentBookingWidget extends State<MedicaminaDashAppointmentBookingWidget> {
  final dio = Dio();
  var _clinics = [];
  var _loaded = false;
  var _searched = [];
  var _searchTerm = '';
  TextEditingController? _searchInputController;

  @override
  void initState() {
    super.initState();
    _searchInputController = TextEditingController(text: _searchTerm);
    getClinics();
  }

  void getClinics() async {
    Position? position;

    try {
      position = await _determinePosition();
    } catch (err) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permissions needed'),
            content: const Text('Medicamina requires acccess to your devices location to provide accurate information'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () async {
                  await Geolocator.openAppSettings();
                  Navigator.of(context).pop();
                  Modular.to.navigate('/dash/appointments');
                },
              ),
            ],
          );
        },
      );
    }
    var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/appointment/booking' : 'http://localhost:8080/dash/appointment/booking';
    var response = await dio.post(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
        },
        validateStatus: (status) => true,
      ),
      data: {
        'latitude': position!.latitude,
        'longitude': position!.longitude,
      },
    );
    for (var clinic in response.data) {
      _clinics.add(clinic);
    }
    // print(response.data[0]['clinic']['doctors']);
    setState(() {
      _clinics = _clinics;
      _loaded = true;
      _searched = List.from(_clinics);
    });
  }

  void updateSearched(String searchTerm) {
    _searched.clear();
    if (searchTerm.isEmpty) {
      setState(() {
        _searched = List.from(_clinics);
      });
    }
    if (searchTerm.isNotEmpty) {
      for (var clinic in _clinics) {
        String clinicName = clinic['clinic']['name'].toLowerCase();
        String clinicAddress = clinic['clinic']['address'].toLowerCase();
        String clinicSpeciality = clinic['clinic']['speciality'].toLowerCase();
        String clinicSuburb = clinic['clinic']['suburb'].toLowerCase();
        Fuzzy fuzzy = Fuzzy([clinicName, clinicAddress, clinicSpeciality, clinicSuburb]);

        List<Result<dynamic>> results = fuzzy.search(searchTerm.toLowerCase());

        if (results.isNotEmpty) {
          List<dynamic> matchedStrings = results.map((result) => result.item).toList();

          if (matchedStrings.length > 0) {
            _searched.add(clinic);
            break;
          }
        }

        if (clinic['clinic']['doctors'].isNotEmpty) {
          results = [];
          for (var doctor in clinic['clinic']['doctors']) {
            String doctorName = doctor['name'].toLowerCase();
            String doctorSpeciality = doctor['speciality'].toLowerCase();
            fuzzy = Fuzzy([doctorName, doctorSpeciality]);
            results = fuzzy.search(searchTerm.toLowerCase());
            if (results.isNotEmpty) {
              _searched.add(clinic);
              break;
            }
          }
        }

        // TODO: Search doctors

        // for (var doctor in clinic['doctors']) {
        //   if (clinic['doctors'][doctor]['name'] == searchTerm) {
        //     _searched.add(_clinics[clinic]);
        //   }
        //   if (clinic['doctors'][doctor]['specialty'] == searchTerm) {
        //     _searched.add(_clinics[clinic]);
        //   }
        // }
      }
    }

    // print(_searched);
  }

  @override
  Widget build(BuildContext context) {
    if (_clinics.isEmpty && !_loaded) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text('Book an appointment', style: Theme.of(context).textTheme.displaySmall),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: TextField(
                    controller: _searchInputController,
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value;
                      });
                      updateSearched(_searchTerm);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Speciality, practice or suburb',
                      prefixIcon: Icon(Icons.search),
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
                            child: Text('Search more!'),
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
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Modular.get<MedicaminaThemeState>().getDarkMode() ? Color.fromARGB(255, 72, 72, 72) : Colors.grey.shade100,
                    highlightColor: Modular.get<MedicaminaThemeState>().getDarkMode() ? Color.fromARGB(255, 96, 96, 96) : Colors.grey.shade300,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (_clinics.isEmpty && _loaded) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text('Book an appointment', style: Theme.of(context).textTheme.displaySmall),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: TextField(
                    controller: _searchInputController,
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value;
                      });
                      updateSearched(_searchTerm);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Speciality, practice, physician, suburb or postcode',
                      prefixIcon: Icon(Icons.search),
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
                            child: Text('Search more!'),
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
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Text('No results nearby to show'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: Text('Book an appointment', style: Theme.of(context).textTheme.displaySmall),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: TextField(
                  controller: _searchInputController,
                  onChanged: (value) {
                    setState(() {
                      _searchTerm = value;
                    });
                    updateSearched(_searchTerm);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Speciality, practice or suburb',
                    prefixIcon: Icon(Icons.search),
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
                          child: Text('Search more!'),
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
              for (var clinic in _searched) _MedicaminaDashAppointmentBookingClinicWidget(clinic: clinic),
            ],
          ),
        ),
      ),
    );
  }
}

String formatZero(var zero) {
  if (zero == 0) {
    return '00';
  }
  if (zero == 1) {
    return '01';
  }
  if (zero == 2) {
    return '02';
  }
  if (zero == 3) {
    return '03';
  }
  if (zero == 4) {
    return '04';
  }
  if (zero == 5) {
    return '05';
  }
  if (zero == 6) {
    return '06';
  }
  if (zero == 7) {
    return '07';
  }
  if (zero == 8) {
    return '08';
  }
  if (zero == 9) {
    return '09';
  }
  return zero.toString();
}

class _MedicaminaDashAppointmentBookingClinicWidget extends StatelessWidget {
  var clinic;

  _MedicaminaDashAppointmentBookingClinicWidget({this.clinic, super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();
    bool displayTime = true;
    var openTime;
    var closeTime;
    var openToday;

    if (clinic['clinic']['hours'].isEmpty) {
      displayTime = false;
    } else {
      // Format the date to get the day of the week
      String dayOfWeek = DateFormat('EEEE').format(now);
      if (dayOfWeek == 'Sunday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['sundayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['sundayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['sundayOperating'];
      }
      if (dayOfWeek == 'Monday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['mondayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['mondayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['mondayOperating'];
      }
      if (dayOfWeek == 'Tuesday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['tuesdayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['tuesdayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['tuesdayOperating'];
      }
      if (dayOfWeek == 'Wednesday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['wednesdayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['wednesdayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['wednesdayOperating'];
      }
      if (dayOfWeek == 'Thursday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['thursdayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['thursdayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['thursdayOperating'];
      }
      if (dayOfWeek == 'Friday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['fridayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['fridayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['fridayOperating'];
      }
      if (dayOfWeek == 'Saturday') {
        openTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['saturdayOpen']).toLocal());
        closeTime = TimeOfDay.fromDateTime(DateTime.parse(clinic['clinic']['hours'][0]['saturdayClose']).toLocal());
        openToday = clinic['clinic']['hours'][0]['saturdayOperating'];
      }
    }

    return Container(
      height: 100,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            Modular.to.navigate('/dash/appointment/doctor/' + clinic['id'], arguments: clinic['clinic']['doctors']);
            // Modular.to.navigate('/dash/appointment/booking/' + clinic['id']);
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
                              clinic['clinic']['name'],
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.arrow_forward)),
                        ],
                      ),
                      Row(children: [Text(clinic['clinic']['address'] + ', ' + clinic['clinic']['suburb'])]),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              displayTime
                                  ? openToday
                                      ? 'Open from ${openTime!.hour}:${formatZero(openTime!.minute)} to ${closeTime!.hour}:${formatZero(closeTime!.minute)} today'
                                      : 'Closed today'
                                  : 'Open times not available',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color.fromARGB(255, 132, 132, 132),
                                  ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 12), child: Text(clinic['distance'].toStringAsFixed(1) + 'km away'))
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
    );
  }
}
