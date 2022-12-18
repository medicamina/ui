import 'package:flutter/material.dart';
import 'package:medicamina/pages/not_found.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:beamer/beamer.dart';
import 'package:medicamina/pages/default.dart';
import 'package:medicamina/pages/auth.dart';
import 'package:medicamina/pages/dash.dart';
import 'package:medicamina/pages/pricing.dart';
import 'package:medicamina/globals.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    setBrowserTabTitle: false,
    initialPath: '/',
    notFoundPage: const BeamPage(child: MedicaminaNotFound()),
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Marketing
        '/': (context, state, data) => const MedicaminaDefaultPage(title: 'medicamina'),
        '/pricing': (context, state, data) => const MedicaminaPricingPage(),
        // Authentication
        '/login': (context, state, data) => const MedicaminaAuthPage(),
        '/register': (context, state, data) => const MedicaminaAuthPage(),
        '/onboarding': (context, state, date) => const MedicaminaAuthPage(),
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
      theme: ThemeData(),
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _routerDelegate),
    );
  }
}
