import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MedicaminaAuthViewIfLoggedOutOnlyGuard extends RouteGuard {
  MedicaminaAuthViewIfLoggedOutOnlyGuard() : super(redirectTo: '/dash/home');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return true;
    // return supabase.auth.currentSession != null;
  }
}

class MedicaminaAuthViewIfLoggedInOnlyGuard extends RouteGuard {
  MedicaminaAuthViewIfLoggedInOnlyGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return true;
    // return supabase.auth.currentSession == null;
  }
}

class MedicaminaDefaultLandingPageWebOnlyGuard extends RouteGuard {
  MedicaminaDefaultLandingPageWebOnlyGuard() : super(redirectTo: '/auth/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return kIsWeb;
  }
}

class MedicaminaAuthGuardFix extends RouteGuard {
  MedicaminaAuthGuardFix() : super(redirectTo: '/auth/login');
  int i = 0;

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    if (i == 0) {
      if (Modular.args.uri.toString() == '/auth/') {
        return false;
      }
      if (Modular.args.uri.toString() == '/auth') {
        return false;
      }
    }
    i++;

    return true;
  }
}
