import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Medicamina
import 'package:medicamina_ui/dash/module.dart';
import 'package:medicamina_ui/not-found/widget.dart';
import 'package:medicamina_ui/auth/module.dart';
import 'package:medicamina_ui/landing/widget.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaAppModule extends Module {
  MedicaminaAppModule({Key? key, required this.supabaseClient});
  final SupabaseClient supabaseClient;
  
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

    RedirectRoute('/auth', to: '/auth/'),
    RedirectRoute('/dash', to: '/dash/'),
    WildcardRoute(child: (context, args) => const MedicaminaNotFoundWidget()),
  ];
}
