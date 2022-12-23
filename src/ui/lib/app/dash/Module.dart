import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/dash/Page.dart';

class MedicaminaDashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const MedicaminaDashPage(),
        guards: [],
        children: [
          ChildRoute('/home', child: (context, args) => Text('home')),
          ChildRoute('/history', child: (context, args) => Text('history')),
          ChildRoute('/family', child: (context, args) => Text('family')),
          ChildRoute('/settings', child: (context, args) => Text('settings')),
        ],
      ),
    ];
  }
}
