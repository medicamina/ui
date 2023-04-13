import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/dash/appointment/widget.dart';
import 'package:medicamina/dash/edicts/widget.dart';
import 'package:medicamina/dash/family/module.dart';
import 'package:medicamina/dash/fitness/widget.dart';

// Medicamina
import 'package:medicamina/dash/guards.dart';
import 'package:medicamina/dash/home/widget.dart';
import 'package:medicamina/dash/not-found/widget.dart';
import 'package:medicamina/dash/psychology/module.dart';
import 'package:medicamina/dash/settings/module.dart';
import 'package:medicamina/dash/widget.dart';

class MedicaminaDashModule extends Module {
  @override
  List<Bind> get binds {
    return [
      
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', guards: [MedicaminaDashGuard()], child: (context, args) => const MedicaminaDashWidget(), children: [
        ChildRoute('/home', child: (context, args) => const MedicaminaDashHomeWidget()),
        ChildRoute('/edicts', child: (context, args) => const MedicaminaDashEdictsWidget()),
        ChildRoute('/fitness', child: (context, args) => const MedicaminaDashFitnessWidget()),
        ChildRoute('/appointment', child: (context, args) => const MedicaminaDashAppointmentWidget()),

        // Modules
        ModuleRoute('/family', module: MedicaminaDashFamilyModule()),
        ModuleRoute('/psychology', module: MedicaminaDashPsychologyModule()),
        ModuleRoute('/settings', module: MedicaminaDashSettingsModule()),

        WildcardRoute(child: (context, args) => const MedicaminaDashNotFoundWidget()),
      ]),

      // widgets
      RedirectRoute('/dash/home/', to: '/dash/home'),
      RedirectRoute('/dash/edicts/', to: '/dash/edicts'),
      RedirectRoute('/dash/fitness/', to: '/dash/fitness'),
      RedirectRoute('/dash/appointment/', to: '/dash/appointment'),
      // modules
      RedirectRoute('/dash/family', to: '/dash/family/'),
      RedirectRoute('/dash/psychology', to: '/dash/psychology/'),
      RedirectRoute('/dash/settings', to: '/dash/settings/'),
    ];
  }
}
