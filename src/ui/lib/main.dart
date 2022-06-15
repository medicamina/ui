import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:beamer/beamer.dart';
import 'default.dart';
import 'login.dart';
import 'dash.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const MedicaminaDefaultPage(title: 'medicamina'),
        '/login': (context, state, data) => const MedicaminaLoginPage(),
        '/register': (context, state, data) => const MedicaminaLoginPage(),
        '/dashboard': (context, state, data) => MedicaminaDashboardPage(),
        '/dashboard/*': (context, state, data) => MedicaminaDashboardPage(),
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
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _routerDelegate)
    );
  }
}