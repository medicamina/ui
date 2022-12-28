import 'package:flutter/material.dart';

class MedicaminaDashConsultationPage extends StatefulWidget {
  const MedicaminaDashConsultationPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashConsultationPage> createState() => _MedicaminaDashConsultationPageState();
}

class _MedicaminaDashConsultationPageState extends State<MedicaminaDashConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 48),
      Text('Book an appointment'),
      SizedBox(height: 48),
      CircularProgressIndicator()
    ],);
  }
}