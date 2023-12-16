import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medicamina_ui/states.dart';

class MedicaminaAppWidget extends StatelessWidget {
  const MedicaminaAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<MedicaminaThemeState>().setDarkMode(false);

    return MaterialApp.router(
      title: 'medicamina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(0, 144, 241, 1),
          secondary: const Color.fromRGBO(241, 96, 0, 1),
          tertiary: const Color.fromRGBO(241, 0, 144, 1),
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      themeMode: Modular.get<MedicaminaThemeState>().getThemeMode(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
