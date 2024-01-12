import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaAuthGuard extends RouteGuard {
  MedicaminaAuthGuard() : super(redirectTo: '/dash');

  @override
  bool canActivate(String path, ModularRoute route) {
    return Modular.get<MedicaminaUserState>().getToken() == null;
  }
}