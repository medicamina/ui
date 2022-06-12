import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'default.dart';
import 'login.dart';
import 'dash.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medicamina',
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LandingPage(title: 'medicamina'),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const LoginPage(),
        '/dashboard': (BuildContext context) => const DashboardPage()
      },
      navigatorObservers: [NavigationHistoryObserver()]
    );
  }
}


