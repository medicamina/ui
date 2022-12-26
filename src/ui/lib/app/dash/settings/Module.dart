import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/settings/Page.dart';

import '../../not_found/Page.dart';

class MedicaminaDashSettingsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => const MedicaminaDashSettingsPage(), 
      children: [
        ChildRoute('/overview', child: (context, args) => const Text('overview'), transition: TransitionType.noTransition),
        ChildRoute('/security', child: (context, args) => const Text('security'), transition: TransitionType.noTransition),
        ChildRoute('/profile', child: (context, args) => const Text('profile'), transition: TransitionType.noTransition),
        ChildRoute('/upgrade', child: (context, args) => const Text('upgrade'), transition: TransitionType.noTransition)
      ]),

      WildcardRoute(child: (context, args) => const MedicaminaNotFoundPage()),
    ];
  }
}
