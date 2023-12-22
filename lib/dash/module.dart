import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/appointment/booking/widget.dart';

// Medicamina
import 'package:medicamina_ui/dash/appointment/widget.dart';
import 'package:medicamina_ui/dash/edicts/widget.dart';
import 'package:medicamina_ui/dash/family/module.dart';
import 'package:medicamina_ui/dash/fitness/widget.dart';
import 'package:medicamina_ui/dash/guards.dart';
import 'package:medicamina_ui/dash/home/widget.dart';
import 'package:medicamina_ui/dash/not-found/widget.dart';
import 'package:medicamina_ui/dash/psychology/module.dart';
import 'package:medicamina_ui/dash/settings/module.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/dash/widget.dart';

class MedicaminaDashModule extends Module {
  @override
  List<Bind> get binds {
    return [Bind.lazySingleton((i) => MedicaminaTodaysDrugs())];
  }

  @override
  List<ModularRoute> get routes {
    return [
      // widgets
      RedirectRoute('/dash/home/', to: '/dash/home'),
      RedirectRoute('/dash/edicts/', to: '/dash/edicts'),
      RedirectRoute('/dash/fitness/', to: '/dash/fitness'),
      RedirectRoute('/dash/appointment/', to: '/dash/appointment'),
      RedirectRoute('/dash/appointment/booking/',
          to: '/dash/appointment/booking'),
      // modules
      RedirectRoute('/dash/family', to: '/dash/family/'),
      RedirectRoute('/dash/psychology', to: '/dash/psychology/'),
      RedirectRoute('/dash/settings', to: '/dash/settings/'),

      ChildRoute('/',
          guards: [MedicaminaDashGuard()],
          child: (context, args) => const MedicaminaDashWidget(),
          children: [
            RedirectRoute('/home/', to: '/home'),
            RedirectRoute('/edicts/', to: '/edicts'),
            RedirectRoute('/fitness/', to: '/fitness'),
            RedirectRoute('/appointment/', to: '/appointment'),
            RedirectRoute('/appointment/booking/', to: '/appointment/booking'),
            // modules
            RedirectRoute('/family', to: '/family/'),
            RedirectRoute('/psychology', to: '/psychology/'),
            RedirectRoute('/settings', to: '/settings/'),

            ChildRoute(
              '/home',
              child: (context, args) => const MedicaminaDashHomeWidget(),
            ),
            ChildRoute(
              '/edicts',
              child: (context, args) => const MedicaminaDashEdictsWidget(),
            ),
            ChildRoute(
              '/fitness',
              child: (context, args) => const MedicaminaDashFitnessWidget(),
            ),
            ChildRoute(
              '/appointment',
              child: (context, args) => const MedicaminaDashAppointmentWidget(),
            ),
            ChildRoute(
              '/appointment/booking',
              child: (context, args) =>
                  MedicaminaDashboardAppointmentBookingWidget(),
            ),

            // Modules
            ModuleRoute(
              '/family',
              module: MedicaminaDashFamilyModule(),
            ),
            ModuleRoute(
              '/psychology',
              module: MedicaminaDashPsychologyModule(),
            ),
            ModuleRoute(
              '/settings',
              module: MedicaminaDashSettingsModule(),
            ),

            WildcardRoute(
              child: (context, args) => const MedicaminaDashNotFoundWidget(),
            ),
          ]),
    ];
  }
}
