import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaDashGuard extends RouteGuard {
  MedicaminaDashGuard() : super(redirectTo: '/auth/login');

  @override
  bool canActivate(String path, ModularRoute router) {
    return true;
    return Modular.get<SupabaseClient>().auth.currentUser != null;
  }
}