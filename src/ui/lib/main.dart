import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:medicamina/app/module.dart';
import 'package:medicamina/app/widget.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  final supabase = await Supabase.initialize(
    url: 'https://ebijrtlgfwkoxtuzsjkk.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViaWpydGxnZndrb3h0dXpzamtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzExNjUxOTUsImV4cCI6MTk4Njc0MTE5NX0.Kf_aRtsE9qO7obQQfEv96wg7AyGSAIA__XhBelxdL24',
  ).then((value) => value.client);

  runApp(
    ModularApp(
      module: MedicaminaAppModule(client: supabase),
      child: const MedicaminaAppWidget(),
    ),
  );
}

extension PushNamedOrPopUntil on IModularNavigator {
  void pushNamedOrPopUntil(String uri) {
    if (uri == Modular.args.uri.toString()) {
      return;
    } 
    for (var e in Modular.to.navigateHistory) {
      if (e.uri.toString() == uri) {
        Modular.to.pushNamedAndRemoveUntil(uri, ModalRoute.withName(e.uri.toString()));
        return;
      }
    }
    Modular.to.pushNamed(uri);
  }
}
