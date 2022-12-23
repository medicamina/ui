import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/Page.dart';
import 'package:medicamina/app/auth/Guards.dart';
import 'package:medicamina/app/auth/Module.dart';
import 'package:medicamina/app/dash/Module.dart';
import 'package:medicamina/app/not_found/Page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaAppModule extends Module {
  @override
  List<Bind> get binds {
    return [Bind.singleton((i) => Supabase.instance.client)];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaAppPage(),
        guards: [MedicaminaDefaultLandingPageWebOnlyGuard()],
      ),
      // Authentication and Marketing
      ChildRoute(
        '/auth',
        child: (context, args) => Container(),
        guards: [MedicaminaAuthGuardFix()],
      ),
      ModuleRoute(
        '/auth',
        module: MedicaminaAuthModule(),
        guards: [MedicaminaAuthViewIfLoggedOutOnlyGuard()],
      ),
      // Dashboard
      ModuleRoute(
        '/dash',
        module: MedicaminaDashModule(),
        guards: [MedicaminaAuthViewIfLoggedInOnlyGuard()],
      ),
      WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
    ];
  }
}
