import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/auth/Guards.dart';
import 'package:medicamina/app/auth/Page.dart';

class MedicaminaDefaultLandingModule extends Module {
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
        guards: [MedicaminaDefaultLandingPageWebOnlyGuard()],
      ),
    ];
  }
}
