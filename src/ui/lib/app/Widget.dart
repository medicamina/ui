import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/globals.dart' as globals;

class MedicaminaAppWidget extends StatelessWidget {
  const MedicaminaAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      title: 'medicamina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
        ),
      ),
      themeMode: globals.darkMode ? ThemeMode.dark : ThemeMode.light,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
