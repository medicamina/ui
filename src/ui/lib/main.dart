import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'landing.dart';
import 'login.dart';

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
        '/': (context) => const LandingPage(title: 'medicamina'),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const LoginPage()
      },
    );
  }
}


