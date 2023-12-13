import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Medicamina
import 'package:medicamina_ui/module.dart';
import 'package:medicamina_ui/widget.dart';

Future<void> main() async {
  setPathUrlStrategy();

  final supabaseClient = await Supabase.initialize(
    url: 'https://ebijrtlgfwkoxtuzsjkk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViaWpydGxnZndrb3h0dXpzamtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzExNjUxOTUsImV4cCI6MTk4Njc0MTE5NX0.Kf_aRtsE9qO7obQQfEv96wg7AyGSAIA__XhBelxdL24',
  ).then((value) => value.client);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(
    ModularApp(
      module: MedicaminaAppModule(supabaseClient: supabaseClient),
      child: const MedicaminaAppWidget(),
    ),
  );
}
