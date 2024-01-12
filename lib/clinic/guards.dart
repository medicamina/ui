import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaClinicGuard extends RouteGuard {
  MedicaminaClinicGuard() : super(redirectTo: '/auth/login');

  @override
  bool canActivate(String path, ModularRoute route) {
    return true;

    // return Modular.get<SupabaseClient>().auth.currentUser != null;
  }
}
