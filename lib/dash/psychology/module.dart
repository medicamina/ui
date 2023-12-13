import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/psychology/not-found/widget.dart';
import 'package:medicamina_ui/dash/psychology/widget.dart';

class MedicaminaDashPsychologyModule extends Module {
  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/',
          child: (context, args) => const MedicaminaDashPsychologyWidget(),
          children: []),
      WildcardRoute(
          child: (context, args) =>
              const MedicaminaDashPsychologyNotFoundWidget()),
    ];
  }
}
