import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/States.dart';
import 'package:medicamina/app/AppBar.dart';
import 'package:medicamina/app/auth/Guards.dart';
import 'package:medicamina/app/States.dart';
import 'package:medicamina/app/auth/landing/Page.dart';
import 'package:medicamina/app/auth/login/Guards.dart';
import 'package:medicamina/app/auth/login/Page.dart';
import 'package:medicamina/app/auth/register/Page.dart';
import 'package:medicamina/app/auth/password/Page.dart';
import 'package:medicamina/app/dash/Module.dart';
import 'package:medicamina/app/not_found/Page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaAppModule extends Module {
  MedicaminaAppModule({Key? key, required this.client});
  late final SupabaseClient client;

  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton((i) => const MedicaminaAppBarWidget()),
      Bind.singleton((i) => MedicaminaAppBarLoadingState()),
      Bind.singleton((i) => MedicaminaThemeState()),
      Bind.singleton((i) => client),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaDefaultLandingPage(),
        guards: [
          MedicaminaDefaultLandingPageWebOnlyGuard(),
          MedicaminaViewIfLoggedOutOnlyGuard(),
        ],
      ),
      ChildRoute('/login', child: (context, args) => const MedicaminaAuthLoginPage(), guards: [MedicaminaViewIfLoggedOutOnlyGuard()]),
      ChildRoute('/register', child: (context, args) => const MedicaminaAuthRegisterPage(), guards: [MedicaminaViewIfLoggedOutOnlyGuard()]),
      ChildRoute('/password', child: (context, args) => const MedicaminaAuthPasswordResetPage(), guards: [MedicaminaViewIfLoggedOutOnlyGuard()]),
      ChildRoute('/onboarding', child: (context, args) => Text('/onboarding')),
  
      RedirectRoute('/dash', to: '/dash/'),
      RedirectRoute('/dash/settings', to: '/dash/settings/'),
      ModuleRoute('/dash', module: MedicaminaDashModule()),

      WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
    ];
  }

  // @override
  // Widget get view => Text('helo');
}
