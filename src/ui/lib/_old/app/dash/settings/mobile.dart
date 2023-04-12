import 'package:flutter/material.dart';

class MedicaminaDashSettingsMobileWidget extends StatefulWidget {
  const MedicaminaDashSettingsMobileWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsMobileWidget> createState() => _MedicaminaDashSettingsMobileWidget();
}

class _MedicaminaDashSettingsMobileWidget extends State<MedicaminaDashSettingsMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Text('Mobile'),
      ),
    );
  }
}
