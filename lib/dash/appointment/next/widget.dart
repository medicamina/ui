import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/clinic/widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medicamina_ui/states.dart';
import 'package:intl/intl.dart';

class MedicaminaClinic {
  late String id;
  late String businessNumber;
  late double longitude;
  late double latitude;
  late String address;
  late String suburb;
  late String country;
  late String? joinCode;
  late String? phoneNumber;
  late String name;
  late String ownerId;
  late String speciality;
  late bool approved;
  late DateTime? approvedAt;
  late String? pictureUrl;
  late DateTime createdAt;
  late DateTime updatedAt;

  MedicaminaClinic(
      {required this.id,
      required this.businessNumber,
      required this.longitude,
      required this.latitude,
      required this.address,
      required this.suburb,
      required this.country,
      required this.joinCode,
      required this.phoneNumber,
      required this.name,
      required this.ownerId,
      required this.speciality,
      required this.approved,
      required this.approvedAt,
      required this.pictureUrl,
      required this.createdAt,
      required this.updatedAt});
}

class MedicaminaDoctor {
  late String id;
  late String userId;
  late String name;
  late String? pictureUrl;
  late String speciality;
  late bool approved;
  late DateTime? approvedAt;
  late DateTime createdAt;
  late DateTime updatedAt;

  MedicaminaDoctor({required this.id, required this.userId, required this.name, required this.pictureUrl, required this.speciality, required this.approved, required this.approvedAt, required this.createdAt, required this.updatedAt});
}

class MedicaminaAppointment {
  late final DateTime time;
  late String id;
  late String clinicId;
  late String doctorId;
  late String patientId;
  late bool approved;
  late DateTime? approvedAt;
  late String? administratorId;
  late DateTime createdAt;
  late DateTime updatedAt;
  late MedicaminaClinic clinic;
  late MedicaminaDoctor doctor;
  late bool newest = false;

  MedicaminaAppointment({
    required this.time,
    required this.id,
    required this.clinicId,
    required this.doctorId,
    required this.patientId,
    required this.approved,
    required this.approvedAt,
    required this.administratorId,
    required this.createdAt,
    required this.updatedAt,
    required this.clinic,
    required this.doctor,
  });

  MedicaminaAppointment.simple({required this.time});

  setNewest(bool isNewest) {
    newest = isNewest;
  }

  getNewest() {
    return newest;
  }

  getDate() {
    String suffix = 'th';
    final int digit = time.day % 10;
    if ((digit > 0 && digit < 4) && (time.day < 11 || time.day > 13)) {
      suffix = <String>['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("E, MMM d'$suffix' yyyy").format(time);
  }
}

class MedicaminaDashAppointmentNextWidget extends StatefulWidget {
  const MedicaminaDashAppointmentNextWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashAppointmentNextWidget> createState() => _MedicaminaDashAppointmentNextWidgetState();
}

class _MedicaminaDashAppointmentNextWidgetState extends State<MedicaminaDashAppointmentNextWidget> {
  final dio = Dio();
  var loading = true;

  @override
  void initState() {
    super.initState();
    getApppointments();
  }

  void getApppointments() async {
    var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/appointment/booking' : 'http://localhost:8080/dash/appointment/booking';
    var result = await dio.get(
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
      for (var appointment in result.data) {
        print(appointment['time']);
        appointments.add(
          MedicaminaAppointment(
            time: DateTime.parse(appointment['time']),
            id: appointment['id'],
            clinicId: appointment['clinicId'],
            doctorId: appointment['doctorId'],
            patientId: appointment['patientId'],
            approved: appointment['approved'],
            approvedAt: appointment['approvedAt'] != null ? DateTime.parse(appointment['approvedAt']) : null,
            administratorId: appointment['administratorId'],
            createdAt: DateTime.parse(appointment['createdAt']),
            updatedAt: DateTime.parse(appointment['updatedAt']),
            clinic: MedicaminaClinic(
              id: appointment['clinic']['id'],
              businessNumber: appointment['clinic']['businessNumber'],
              longitude: appointment['clinic']['longitude'],
              latitude: appointment['clinic']['latitude'],
              address: appointment['clinic']['address'],
              suburb: appointment['clinic']['suburb'],
              country: appointment['clinic']['country'],
              joinCode: appointment['clinic']['joinCode'],
              phoneNumber: appointment['clinic']['phoneNumber'],
              name: appointment['clinic']['name'],
              ownerId: appointment['clinic']['ownerId'],
              speciality: appointment['clinic']['speciality'],
              approved: appointment['clinic']['approved'],
              approvedAt: appointment['approvedAt'] != null ? DateTime.parse(appointment['approvedAt']) : null,
              pictureUrl: appointment['clinic']['pictureUrl'],
              createdAt: DateTime.parse(appointment['clinic']['createdAt']),
              updatedAt: DateTime.parse(appointment['clinic']['updatedAt']),
            ),
            doctor: MedicaminaDoctor(
              id: appointment['doctor']['id'],
              userId: appointment['doctor']['userId'],
              name: appointment['doctor']['name'],
              pictureUrl: appointment['doctor']['pictureUrl'],
              speciality: appointment['doctor']['speciality'],
              approved: appointment['doctor']['approved'],
              approvedAt: appointment['doctor']['approvedAt'] != null ? DateTime.parse(appointment['doctor']['approvedAt']) : null,
              createdAt: DateTime.parse(appointment['doctor']['createdAt']),
              updatedAt: DateTime.parse(appointment['doctor']['updatedAt']),
            ),
          ),
        );
      }
      loading = false;
    });
  }

  List<MedicaminaAppointment> appointments = [];

  @override
  Widget build(BuildContext context) {
    if (appointments.isNotEmpty) {
      MedicaminaAppointment element = MedicaminaAppointment.simple(time: DateTime(3000));
      for (var i in appointments) {
        var isNewer = i.time.compareTo(element.time);
        if (isNewer <= -1) {
          element = i;
        }
      }
      appointments[appointments.indexOf(element)].setNewest(true);
    }

    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointments',
                      style: TextStyle(
                        fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Modular.to.navigate('appointment/booking');
                      },
                      icon: const Icon(Icons.add_circle_outline),
                      tooltip: 'New appointment',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (loading) const CircularProgressIndicator(),
        for (var i in appointments) _MedicaminaDashAppointmentWidget(i)
      ],
    );
  }
}

class _MedicaminaDashAppointmentWidget extends StatelessWidget {
  final MedicaminaAppointment _MedicaminaAppointment;
  final dio = Dio();

  _MedicaminaDashAppointmentWidget(this._MedicaminaAppointment);

  @override
  Widget build(BuildContext context) {
    String formattedTime = (_MedicaminaAppointment.time.toLocal().hour % 12 == 0 ? 12 : _MedicaminaAppointment.time.toLocal().hour % 12).toString().padLeft(2, '0') +
        ':' +
        _MedicaminaAppointment.time.toLocal().minute.toString().padLeft(2, '0') +
        (_MedicaminaAppointment.time.toLocal().hour >= 12 ? ' PM' : ' AM');
    // print(_MedicaminaAppointment);
    return SizedBox(
      // height: MediaQuery.of(context).size.width >= 500
      //     ? 128
      //     : MediaQuery.of(context).size.width >= 300
      //         ? 140
      //         : 160,
      child: Card(
        color: _MedicaminaAppointment.getNewest() ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withAlpha(130),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        _MedicaminaAppointment.getDate(),
                        // overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 26, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        _MedicaminaAppointment.doctor.name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 6),
                      child: Text(
                        formattedTime,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 6),
                      child: Text(
                        _MedicaminaAppointment.clinic.address + ', ' + _MedicaminaAppointment.clinic.suburb,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      verticalOffset: 34,
                      message: 'Get directions',
                      child: SizedBox.fromSize(
                        size: const Size(84, 84),
                        child: ClipOval(
                          child: Material(
                            color: Theme.of(context).hoverColor.withAlpha(15),
                            child: InkWell(
                              radius: 84,
                              onTap: () async {
                                String address = Uri.encodeComponent(_MedicaminaAppointment.clinic.address + ', ' + _MedicaminaAppointment.clinic.suburb);
                                var googleUrl = Uri(scheme: 'https', host: 'www.google.com', path: '/maps/search/$address');
                                if (await canLaunchUrl(googleUrl)) {
                                  await launchUrl(googleUrl);
                                } else {
                                  throw 'Could not open the map.';
                                }
                              },
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.map,
                                    size: 44,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Cancel',
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white70,
                        ),
                        onPressed: () async {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // Prevents closing the dialog by tapping outside
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Cancel appointment'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Are you sure you want to cancel?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Confirm'),
                                    onPressed: () async {
                                      var url = kReleaseMode
                                          ? 'https://medicamina.azurewebsites.net/dash/appointmnet/booking/' + _MedicaminaAppointment.id + '/cancel'
                                          : 'http://localhost:8080/dash/appointmnet/booking/' + _MedicaminaAppointment.id + '/cancel';
                                      var respose = await dio.post(
                                        url,
                                        options: Options(
                                          headers: {
                                            'Content-Type': 'application/json; charset=UTF-8',
                                            'Authorization': await Modular.get<MedicaminaUserState>().getToken() as String,
                                          },
                                          validateStatus: (status) => true,
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                      Modular.to.pushReplacementNamed(Modular.to.path);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
