import 'package:flutter/material.dart';

class MedicaminaPasswordResetPage extends StatefulWidget {
  const MedicaminaPasswordResetPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaPasswordResetPage> createState() => _MedicaminaPasswordResetPage();
}

class _MedicaminaPasswordResetPage extends State<MedicaminaPasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
