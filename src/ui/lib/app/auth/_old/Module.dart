import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/auth/Guards.dart';
import 'package:medicamina/app/auth/Page.dart';
import 'package:medicamina/app/auth/login/Page.dart';
import 'package:medicamina/app/auth/password/Page.dart';
import 'package:medicamina/app/auth/register/Page.dart';

class MedicaminaAuthModule extends Module {
  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaAuthPage(),
        guards: [MedicaminaAuthGuardFix()],
        children: [
          ChildRoute('/login', child: (context, args) => const MedicaminaAuthLoginPage()),
          ChildRoute('/register', child: (context, args) => const MedicaminaAuthRegisterPage()),
          ChildRoute('/password', child: (context, args) => const MedicaminaAuthPasswordResetPage()),
          ChildRoute('/onboarding', child: (context, args) => const Text('onboarding')),
        ],
      ),
    ];
  }
}
