import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:medicamina/pages/landing.dart';
import 'package:medicamina/pages/dash.dart';
import 'package:medicamina/globals.dart' as globals;

final supabase = Supabase.instance.client;

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: globals.supabaseUrl,
    anonKey: globals.supabaseKey,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    setBrowserTabTitle: false,
    guards: [
      BeamGuard(
        pathPatterns: ['/'],
        check: (context, location) => kIsWeb,
        beamToNamed: (origin, target) => '/login',
        replaceCurrentStack: true,
      ),
      BeamGuard(
        pathPatterns: ['/dashboard', '/history', '/family', '/account', '/security', '/subscription', '/profile'],
        check: (context, location) {
          if (supabase.auth.currentSession == null) {
            return false;
          }
          return true;
        },
        beamToNamed: (origin, target) => '/login',
        replaceCurrentStack: true,
      ),
      BeamGuard(
        pathPatterns: ['/','/login', '/register'],
        check: (context, location) {
          if (supabase.auth.currentSession == null) {
            return true;
          }
          return false;
        },
        beamToNamed: (origin, target) => '/dashboard',
        replaceCurrentStack: true,
      ),
    ],
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Marketing
        '/': (context, state, data) => const MedicaminaLandingPage(),
        // Authentication
        '/login': (context, state, data) => const MedicaminaLandingPage(),
        '/register': (context, state, data) => const MedicaminaLandingPage(),
        '/password': (context, state, data) => const MedicaminaLandingPage(),
        '/onboarding': (context, state, date) => const MedicaminaLandingPage(),
        // Dashboard
        '/dashboard': (context, state, data) => MedicaminaDashboardPage(),
        '/family': (context, state, data) => MedicaminaDashboardPage(),
        '/history': (context, state, data) => MedicaminaDashboardPage(),
        '/account': (context, state, data) => MedicaminaDashboardPage(),
        '/security': (context, state, data) => MedicaminaDashboardPage(),
        '/subscription': (context, state, data) => MedicaminaDashboardPage(),
        '/profile': (context, state, data) => MedicaminaDashboardPage(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'medicamina',
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:  Color.fromARGB(255, 88, 88, 88),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 88, 88, 88),
        ),
      ),
      themeMode: globals.darkMode ? ThemeMode.dark : ThemeMode.light,
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _routerDelegate),
    );
  }
}
