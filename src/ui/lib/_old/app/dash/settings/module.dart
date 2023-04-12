import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/settings/page.dart';
import 'package:medicamina/app/dash/settings/billing/widget.dart';
import 'package:medicamina/app/dash/settings/account/widget.dart';
import 'package:medicamina/app/dash/settings/security/widget.dart';
import 'package:medicamina/app/dash/settings/state.dart';
import 'package:medicamina/app/not_found/page.dart';

class MedicaminaDashSettingsModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MedicaminaDashSettingsState())
  ];

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
