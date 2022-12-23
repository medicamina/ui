import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:medicamina/globals.dart' as globals;
import 'package:medicamina/app/Module.dart';
import 'package:medicamina/app/Widget.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: globals.supabaseUrl,
    anonKey: globals.supabaseKey,
  );

  runApp(
    ModularApp(
      module: MedicaminaAppModule(),
      child: const MedicaminaAppWidget(),
    ),
  );
}
