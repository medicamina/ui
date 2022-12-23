import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/auth/AppBar.dart';

class MedicaminaAuthPage extends StatefulWidget {
  const MedicaminaAuthPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaAuthPage> createState() => _MedicaminaAuthPage();
}

class _MedicaminaAuthPage extends State<MedicaminaAuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MedicaminaAuthAppBarWidget(),
      body: RouterOutlet(),
    );
  }
}
