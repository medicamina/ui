import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaAuthGuard extends RouteGuard {
  MedicaminaAuthGuard() : super(redirectTo: '/dash');

  @override
  bool canActivate(String path, ModularRoute route) {
    return Modular.get<SupabaseClient>().auth.currentUser == null;
  }
}