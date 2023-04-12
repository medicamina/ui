import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina/dash/settings/account/widget.dart';
import 'package:medicamina/dash/settings/billing/widget.dart';
import 'package:medicamina/dash/settings/not-found/widget.dart';
import 'package:medicamina/dash/settings/security/widget.dart';
import 'package:medicamina/dash/settings/states.dart';
import 'package:medicamina/dash/settings/widget.dart';

class MedicaminaDashSettingsModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MedicaminaDashSettingsState())
  ];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => const MedicaminaDashSettingsWidget(), 
      children: [
        ChildRoute('/account', child: (context, args) => const MedicaminaDashSettingsAccountWidget(), transition: TransitionType.scale),
        ChildRoute('/security', child: (context, args) => const MedicaminaDashSettingsSecurityWidget(), transition: TransitionType.scale),
        ChildRoute('/billing', child: (context, args) => const MedicaminaDashSettingsBillingWidget(), transition: TransitionType.scale)
      ]),

      RedirectRoute('/dash/settings/account/', to: '/dash/settings/account'),
      RedirectRoute('/dash/settings/security/', to: '/dash/settings/security'),
      RedirectRoute('/dash/settings/billing/', to: '/dash/settings/billing'),
      WildcardRoute(child: (context, args) => const MedicaminaDashSettingsNotFoundWidget()),
    ];
  }
}
