import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/auth/appbar/widget.dart';

class MedicaminaAuthWidget extends StatelessWidget {
  const MedicaminaAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Modular.args.uri.toString() == '/auth/') {
      Modular.to.navigate('/auth/login');
    }
    return const Scaffold(
      appBar: MedicaminaAuthAppBarWidget(),
      body: RouterOutlet(),
    );
  }
}
