import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/clinic/module.dart';

// Medicamina
import 'package:medicamina_ui/dash/module.dart';
import 'package:medicamina_ui/not-found/widget.dart';
import 'package:medicamina_ui/auth/module.dart';
import 'package:medicamina_ui/landing/widget.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaAppModule extends Module {
  MedicaminaAppModule({Key? key});
  
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MedicaminaThemeState()),
    Bind.singleton((i) => MedicaminaUserState()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const MedicaminaLandingPage()),
    ModuleRoute('/auth', module: MedicaminaAuthModule()),
    ModuleRoute('/dash', module: MedicaminaDashModule()),
    ModuleRoute('/clinic', module: MedicaminaClinicModule()),

    RedirectRoute('/auth', to: '/auth/'),
    RedirectRoute('/dash', to: '/dash/'),
    RedirectRoute('/clinic', to: '/clinic/'),
    WildcardRoute(child: (context, args) => const MedicaminaNotFoundWidget()),
  ];
}
