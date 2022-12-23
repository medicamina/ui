import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicaminaDashPage extends StatefulWidget {
  const MedicaminaDashPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashPage> createState() => _MedicaminaDashPage();
}

class _MedicaminaDashPage extends State<MedicaminaDashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('medicamina', style: GoogleFonts.balooTamma2()),
        centerTitle: true,
      ),
      body: const RouterOutlet(),
    );
  }
}
