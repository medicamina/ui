import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashAppointmentDoctorWidget extends StatefulWidget {
  const MedicaminaDashAppointmentDoctorWidget({super.key});

  @override
  State<MedicaminaDashAppointmentDoctorWidget> createState() => _MedicaminaDashAppointmentDoctorWidgetState();
}

class _MedicaminaDashAppointmentDoctorWidgetState extends State<MedicaminaDashAppointmentDoctorWidget> {
  var doctors = [];
  final dio = Dio();
  late String clinicId;

  void getDoctors() async {
    var url = kReleaseMode ? 'https://medicamina.azurewebsites.net/dash/appointment/doctor/' + clinicId : 'http://localhost:8080/dash/appointment/doctor/' + clinicId;
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
        'clinicId': clinicId,
      },
    );

    setState(() {
      doctors = response.data['doctors'];
    });
  }

  @override
  void initState() {
    super.initState();
    clinicId = Modular.to.path.split('/').last;
    getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(6),
          child: Text('Select a doctor', style: Theme.of(context).textTheme.displaySmall),
        ),
        if (doctors.isEmpty) 
          Center(
          child: SizedBox(
            width: 50.0, // Set the width and height to be the same
            height: 50.0,
            child: CircularProgressIndicator(),
          ),
        ),
        for (var doctor in doctors)
          ListTile(
            onTap: () {
              Modular.to.navigate('/dash/appointment/booking/' + clinicId + '/' + doctor['id']);
            },
            onLongPress: () {},
            title: Text(doctor['name']),
          ),
      ],
    );
  }
}
