import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
// import 'package:medicamina_ui/dash/settings/account/widget.dart';
// import 'package:medicamina_ui/dash/settings/billing/widget.dart';
// import 'package:medicamina_ui/dash/settings/doctor/desktop.dart';
import 'package:medicamina_ui/dash/settings/not-found/widget.dart';
// import 'package:medicamina_ui/dash/settings/security/widget.dart';
import 'package:medicamina_ui/dash/settings/states.dart';
// import 'package:medicamina_ui/dash/settings/upgrade/widget.dart';
import 'package:medicamina_ui/dash/settings/widget.dart';

class MedicaminaDashSettingsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => MedicaminaDashSettingsAccountState()),
      ];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaDashSettingsWidget(),
        children: [
          // ChildRoute(
          //   '/account',
          //   child: (context, args) => const MedicaminaDashSettingsAccountWidget(),
          //   transition: TransitionType.scale,
          // ),
          // ChildRoute(
          //   '/security',
          //   child: (context, args) => const MedicaminaDashSettingsSecurityWidget(),
          //   transition: TransitionType.scale,
          // ),
          // ChildRoute(
          //   '/billing',
          //   child: (context, args) => const MedicaminaDashSettingsBillingWidget(),
          //   transition: TransitionType.scale,
          // ),
          // ChildRoute(
          //   '/doctor',
          //   child: (context, args) => const MedicaminaDashSettingsDoctorWidget(),
          //   transition: TransitionType.scale,
          // ),
          // ChildRoute(
          //   '/upgrade',
          //   child: (context, args) => const MedicaminaDashSettingsUpgradeWidget(),
          //   transition: TransitionType.scale,
          // ),
        ],
      ),
      // RedirectRoute('/dash/settings/account/', to: '/dash/settings/account'),
      // RedirectRoute('/dash/settings/security/', to: '/dash/settings/security'),
      // RedirectRoute('/dash/settings/billing/', to: '/dash/settings/billing'),
      // RedirectRoute('/dash/settings/doctor/', to: '/dash/settings/doctor'),
      // RedirectRoute('/dash/settings/upgrade/', to: '/dash/settings/upgrade'),
      WildcardRoute(
        child: (context, args) => const MedicaminaDashSettingsNotFoundWidget(),
      ),
    ];
  }
}
