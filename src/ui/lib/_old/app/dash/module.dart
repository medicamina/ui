import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/consultation/page.dart';
import 'package:medicamina/app/dash/health/page.dart';
import 'package:medicamina/app/dash/page.dart';
import 'package:medicamina/app/dash/edicts/page.dart';
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
      children: [
        ChildRoute('/home', child: (context, args) => const MedicaminaDashHome()),
        ChildRoute('/edicts', child: (context, args) => const MedicaminaDashEdictsPage(), children: []),
        ChildRoute('/health', child: (context, args) => const MedicaminaDashHealthPage()),
        ChildRoute('/appointment', child: (context, args) => const MedicaminaDashConsultationPage()),
        ChildRoute('/family', child: (context, args) => const Text('family'), children: []),
        ModuleRoute('/settings', module: MedicaminaDashSettingsModule()),
  
        WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
      ]),
    ];
  }
}
