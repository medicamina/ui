import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';

// Medicamina
import 'package:medicamina_ui/module.dart';
import 'package:medicamina_ui/widget.dart';
import 'package:medicamina_ui/firebase_options.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ModularApp(
        module: MedicaminaAppModule(),
        child: const MedicaminaAppWidget(),
      ),
    ),
  );
}
