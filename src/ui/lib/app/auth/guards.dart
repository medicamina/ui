import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaViewIfLoggedOutOnlyGuard extends RouteGuard {
  MedicaminaViewIfLoggedOutOnlyGuard() : super(redirectTo: '/dash/home');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    // current session must not exist
    return Modular.get<SupabaseClient>().auth.currentUser == null;
  }
}
