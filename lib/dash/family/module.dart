import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/dash/family/widget.dart';

class MedicaminaDashFamilyModule extends Module {
  @override
  List<Bind> get binds {
    return [
      
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute('/', child: (context, args) => MedicaminaDashFamilyWidget(), children: [

      ]),

      // RedirectRoute('/dash/home/', to: '/dash/home'),
    ];
  }
}
