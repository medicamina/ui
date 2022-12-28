import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/settings/page.dart';
import 'package:medicamina/app/dash/settings/billing/page.dart';
import 'package:medicamina/app/dash/settings/account/page.dart';
import 'package:medicamina/app/dash/settings/security/page.dart';
import 'package:medicamina/app/not_found/page.dart';

class MedicaminaDashSettingsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => const MedicaminaDashSettingsPage(), 
      children: [
        ChildRoute('/account', child: (context, args) => const MedicaminaDashSettingsAccountWidget(), transition: TransitionType.noTransition),
        ChildRoute('/security', child: (context, args) => const MedicaminaDashSettingsSecurityWidget(), transition: TransitionType.noTransition),
        ChildRoute('/billing', child: (context, args) => const MedicaminaDashSettingsBillingWidget(), transition: TransitionType.noTransition)
      ]),

      WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
    ];
  }
}
