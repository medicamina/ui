import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/appointment/booking/calender/widget.dart';
import 'package:medicamina_ui/dash/appointment/booking/doctor/widget.dart';
import 'package:medicamina_ui/dash/appointment/booking/widget.dart';

// Medicamina
import 'package:medicamina_ui/dash/appointment/widget.dart';
import 'package:medicamina_ui/dash/edicts/widget.dart';
import 'package:medicamina_ui/dash/family/module.dart';
import 'package:medicamina_ui/dash/fitness/widget.dart';
import 'package:medicamina_ui/dash/guards.dart';
import 'package:medicamina_ui/dash/home/personal/onboarding/widget.dart';
import 'package:medicamina_ui/dash/home/widget.dart';
import 'package:medicamina_ui/dash/not-found/widget.dart';
import 'package:medicamina_ui/dash/psychology/module.dart';
import 'package:medicamina_ui/dash/settings/module.dart';
import 'package:medicamina_ui/dash/states.dart';
import 'package:medicamina_ui/dash/widget.dart';

class MedicaminaDashModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton((i) => MedicaminaTodaysDrugs()),
      Bind.singleton((i) => MedicmainaPersonalDetails()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      // widgets
      RedirectRoute('/dash/home/', to: '/dash/home'),
      RedirectRoute('/dash/home/personal/', to: '/dash/home/personal'),
      RedirectRoute('/dash/edicts/', to: '/dash/edicts'),
      RedirectRoute('/dash/fitness/', to: '/dash/fitness'),
      RedirectRoute('/dash/appointment/', to: '/dash/appointment'),
      RedirectRoute('/dash/appointment/booking/', to: '/dash/appointment/booking'),
      RedirectRoute('/dash/appointment/doctor/', to: '/dash/appointment/doctor'),
      // modules
      RedirectRoute('/dash/family', to: '/dash/family/'),
      RedirectRoute('/dash/psychology', to: '/dash/psychology/'),
      RedirectRoute('/dash/settings', to: '/dash/settings/'),

      ChildRoute(
        '/',
        guards: [MedicaminaDashGuard()],
        child: (context, args) => const MedicaminaDashWidget(),
        children: [
          RedirectRoute('/home/', to: '/home'),
          RedirectRoute('/home/personal/', to: '/home/personal'),
          RedirectRoute('/edicts/', to: '/edicts'),
          RedirectRoute('/fitness/', to: '/fitness'),
          RedirectRoute('/appointment/', to: '/appointment'),
          RedirectRoute('/appointment/booking/', to: '/appointment/booking'),
          RedirectRoute('/appointment/doctor/', to: '/appointment/doctor'),
          // modules
          RedirectRoute('/family', to: '/family/'),
          RedirectRoute('/psychology', to: '/psychology/'),
          RedirectRoute('/settings', to: '/settings/'),

          ChildRoute(
            '/home',
            child: (context, args) => const MedicaminaDashHomeWidget(),
          ),
          ChildRoute(
            '/home/personal',
            child: (context, args) => const MedicaminaDashPersonalOnboardingWidget(),
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
            child: (context, args) => MedicaminaDashAppointmentBookingWidget(),
          ),
          ChildRoute(
            '/appointment/booking/:clinicId/:doctorId',
            child: (context, args) => MedicaminaDashAppointmentBookingCalendar(),
          ),

          ChildRoute(
            '/appointment/doctor',
            child: (context, args) => MedicaminaDashAppointmentDoctorWidget(),
          ),
          ChildRoute(
            '/appointment/doctor/:clinicId',
            child: (context, args) => MedicaminaDashAppointmentDoctorWidget(),
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
        ],
      ),
    ];
  }
}
