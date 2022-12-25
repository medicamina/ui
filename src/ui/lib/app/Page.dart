import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/auth/AppBar.dart';
import 'package:medicamina/app/auth/landing/Page.dart';

class MedicaminaAppPage extends StatefulWidget {
  const MedicaminaAppPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaAppPage> createState() => _MedicaminaAppPage();
}

class _MedicaminaAppPage extends State<MedicaminaAppPage> {
  PreferredSizeWidget? _shouldShowAuthAppBar() {
    if (Modular.args.uri.toString() == '/' || Modular.args.uri.toString().contains('/auth')) {
      return Modular.get<MedicaminaAuthAppBarWidget>();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _shouldShowAuthAppBar(),
      body: Modular.args.uri.toString() == '/' ? const MedicaminaDefaultLandingPage() : Text('Hello'),
    );
  }
}
