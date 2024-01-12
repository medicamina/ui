import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashGuard extends RouteGuard {
  MedicaminaDashGuard() : super(redirectTo: '/auth/login');

  @override
  bool canActivate(String path, ModularRoute route) {
    //return true;
    return Modular.get<MedicaminaUserState>().getToken() != null;
  }
}
