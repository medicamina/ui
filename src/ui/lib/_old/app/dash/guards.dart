import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaViewIfLoggedInOnlyGuard extends RouteGuard {
  MedicaminaViewIfLoggedInOnlyGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<SupabaseClient>().auth.currentSession != null;
  }
}
