import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/app/auth/landing/Page.dart';

class MedicaminaAppPage extends StatelessWidget {
  const MedicaminaAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('medicamina', style: GoogleFonts.balooTamma2()),
        centerTitle: true,
      ),
      body: const MedicaminaDefaultLandingPage(),
    );
  }
}
