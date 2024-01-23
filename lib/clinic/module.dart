import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/clinic/appointments/widget.dart';
import 'package:medicamina_ui/clinic/guards.dart';
import 'package:medicamina_ui/clinic/not-found/widget.dart';
import 'package:medicamina_ui/clinic/start/widget.dart';
import 'package:medicamina_ui/clinic/widget.dart';

// Medicamina
import 'package:medicamina_ui/dash/states.dart';

class MedicaminaClinicModule extends Module {
  @override
  List<Bind> get binds {
    return [Bind.lazySingleton((i) => MedicaminaTodaysDrugs())];
  }

  @override
  List<ModularRoute> get routes {
    return [
      // widgets
      RedirectRoute('/clinic/appointments/', to: '/clinic/appointments'),
      RedirectRoute('/clinic/prescribe/', to: '/clinic/prescribe'),
      RedirectRoute('/clinic/settings/', to: '/clinic/setttings'),

      ChildRoute('/',
          guards: [MedicaminaClinicGuard()],
          child: (context, args) => const MedicaminaClinicWidget(),
          children: [
            RedirectRoute('/appointments/', to: '/appointments'),
            RedirectRoute('/prescribe/', to: '/prescribe'),
            RedirectRoute('/settings/', to: '/settings'),


            ChildRoute(
              '/appointments',
              child: (context, args) => const MedicaminaClinicAppointmentsWidget(),
            ),
            ChildRoute('/start', child: ((context, args) => const MedicaminaClinicStartWidget())),
          
            WildcardRoute(
              child: (context, args) => const MedicaminaClinicNotFoundWidget(),
            ),
          ]),
    ];
  }
}
