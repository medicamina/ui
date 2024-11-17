import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashGuard extends RouteGuard {
  MedicaminaDashGuard() : super(redirectTo: '/auth/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    //return true;
    return (await Modular.get<MedicaminaUserState>().getToken())?.isNotEmpty ?? false;
  }
}
