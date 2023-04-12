import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/dash/module.dart';
import 'package:medicamina/not-found/widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Medicamina
import 'package:medicamina/auth/module.dart';
import 'package:medicamina/landing/widget.dart';
import 'package:medicamina/states.dart';

class MedicaminaAppModule extends Module {
  MedicaminaAppModule({Key? key, required this.supabaseClient});
  late final SupabaseClient supabaseClient;
  
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MedicaminaThemeState()),
    Bind.singleton((i) => supabaseClient),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const MedicaminaLandingPage()),
    ModuleRoute('/auth', module: MedicaminaAuthModule()),
    ModuleRoute('/dash', module: MedicaminaDashModule()),

    RedirectRoute('/dash', to: '/dash/'),
    WildcardRoute(child: (context, args) => const MedicaminaNotFoundWidget()),
  ];
}
