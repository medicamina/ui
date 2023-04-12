import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/dash/psychology/not-found/widget.dart';
import 'package:medicamina/dash/psychology/widget.dart';

class MedicaminaDashPsychologyModule extends Module {
  @override
  List<Bind> get binds {
    return [
      
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => const MedicaminaDashPsychologyWidget(), children: [

      ]),

      WildcardRoute(child: (context, args) => const MedicaminaDashPsychologyNotFoundWidget()),
    ];
  }
}
