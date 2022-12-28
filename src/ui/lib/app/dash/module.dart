import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/consultation/page.dart';
import 'package:medicamina/app/dash/guards.dart';
import 'package:medicamina/app/dash/page.dart';
import 'package:medicamina/app/dash/history/page.dart';
import 'package:medicamina/app/dash/home/page.dart';
import 'package:medicamina/app/not_found/page.dart';
import 'package:medicamina/app/dash/settings/module.dart';

class MedicaminaDashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => const MedicaminaDashPage(), 
      guards: [MedicaminaViewIfLoggedInOnlyGuard()],
      children: [
        ChildRoute('/home', child: (context, args) => const MedicaminaDashHome()),
        ChildRoute('/history', child: (context, args) => const MedicaminsaDashHistoryPage(), children: []),
        ChildRoute('/appointment', child: (context, args) => const MedicaminaDashConsultationPage()),
        ChildRoute('/family', child: (context, args) => const Text('family'), children: []),
        ModuleRoute('/settings', module: MedicaminaDashSettingsModule()),

        WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
      ]),
    ];
  }
}
