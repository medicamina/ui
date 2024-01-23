import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medicamina_ui/states.dart';

class MedicaminaAppWidget extends StatefulWidget {
  const MedicaminaAppWidget({super.key});

  @override
  State<MedicaminaAppWidget> createState() => _MedicaminaAppWidgetState();
}

class _MedicaminaAppWidgetState extends State<MedicaminaAppWidget> {
  ThemeMode _theme = Modular.get<MedicaminaThemeState>().getThemeMode();

  @override
  void initState() {
    super.initState();
    Modular.get<MedicaminaThemeState>().changedState.subscribe((args) {
      setState(() {
        _theme = Modular.get<MedicaminaThemeState>().getThemeMode();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        title: 'medicamina',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(0, 144, 241, 1),
            secondary: const Color.fromRGBO(241, 96, 0, 1),
            tertiary: const Color.fromRGBO(241, 0, 144, 1),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.baloo2().copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          // textTheme: GoogleFonts.robotoTextTheme(),
        ),
        darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 88, 88, 88),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 88, 88, 88),
            titleTextStyle: GoogleFonts.baloo2().copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          // textTheme: GoogleFonts.robotoTextTheme(),
        ),
        themeMode: _theme,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}

// class MedicaminaAppWidget extends StatelessWidget {
//   const MedicaminaAppWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Modular.get<MedicaminaThemeState>().setDarkMode(false);

//     return CalendarControllerProvider(
//       controller: EventController(),
//       child: MaterialApp.router(
//         title: 'medicamina',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: false).copyWith(
//           colorScheme: ColorScheme.fromSwatch().copyWith(
//             primary: const Color.fromRGBO(0, 144, 241, 1),
//             secondary: const Color.fromRGBO(241, 96, 0, 1),
//             tertiary: const Color.fromRGBO(241, 0, 144, 1),
//           ),
//           appBarTheme: AppBarTheme(
//             titleTextStyle: GoogleFonts.baloo2().copyWith(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//           textTheme: GoogleFonts.robotoTextTheme(),
//         ),
//         darkTheme: ThemeData.dark(useMaterial3: false).copyWith(
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//             backgroundColor: Color.fromARGB(255, 88, 88, 88),
//           ),
//           appBarTheme: AppBarTheme(
//             backgroundColor: const Color.fromARGB(255, 88, 88, 88),
//             titleTextStyle: GoogleFonts.baloo2().copyWith(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//           textTheme: GoogleFonts.robotoTextTheme(),
//         ),
//         themeMode: Modular.get<MedicaminaThemeState>().getThemeMode(),
//         routeInformationParser: Modular.routeInformationParser,
//         routerDelegate: Modular.routerDelegate,
//       ),
//     );
//   }
// }
