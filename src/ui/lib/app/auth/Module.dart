import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/auth/Guards.dart';
import 'package:medicamina/app/auth/Page.dart';
import 'package:medicamina/app/auth/States.dart';

class MedicaminaAuthModule extends Module {
  @override
  List<Bind> get binds {
    return [Bind.singleton((i) => MedicaminaAuthLoadingState())];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaAuthPage(),
        guards: [
          MedicaminaAuthGuardFix()
        ],
        children: [
          ChildRoute('/login', child: (context, args) => const Text('login')),
          ChildRoute('/register', child: (context, args) => const Text('register')),
          ChildRoute('/password', child: (context, args) => const Text('password')),
          ChildRoute('/onboarding', child: (context, args) => const Text('onboarding')),
        ],
      ),
    ];
  }
}
