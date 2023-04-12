import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/guards.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:medicamina/app/states.dart';
import 'package:medicamina/app/appbar.dart';
import 'package:medicamina/app/auth/guards.dart';
import 'package:medicamina/app/auth/landing/page.dart';
import 'package:medicamina/app/auth/landing/guards.dart';
import 'package:medicamina/app/auth/login/page.dart';
import 'package:medicamina/app/auth/register/page.dart';
import 'package:medicamina/app/auth/password/page.dart';
import 'package:medicamina/app/dash/module.dart';
import 'package:medicamina/app/not_found/page.dart';

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
        guards: [MedicaminaDefaultLandingPageWebOnlyGuard(), MedicaminaViewIfLoggedOutOnlyGuard()],
      ),
      ChildRoute(
        '/login',
        child: (context, args) => const MedicaminaAuthLoginPage(),
        guards: [MedicaminaViewIfLoggedOutOnlyGuard()],
      ),
      ChildRoute(
        '/register',
        child: (context, args) => const MedicaminaAuthRegisterPage(),
        guards: [MedicaminaViewIfLoggedOutOnlyGuard()],
      ),
      ChildRoute(
        '/password',
        child: (context, args) => const MedicaminaAuthPasswordResetPage(),
        // guards: [MedicaminaViewIfLoggedOutOnlyGuard()],
      ),
      ChildRoute('/onboarding', child: (context, args) => Text('/onboarding')),

      RedirectRoute('/dash', to: '/dash/'),
      RedirectRoute('/dash/settings', to: '/dash/settings/'),
      RedirectRoute('/dash/settings/', to: '/dash/settings/account'),
      ModuleRoute('/dash', module: MedicaminaDashModule(), guards: [MedicaminaViewIfLoggedInOnlyGuard()]),
      
      WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
    ];
  }
}
