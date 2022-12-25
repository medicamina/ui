import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaDefaultLandingPageWebOnlyGuard extends RouteGuard {
  MedicaminaDefaultLandingPageWebOnlyGuard() : super(redirectTo: '/login');
  int i = 0;

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return kIsWeb;
  }
}