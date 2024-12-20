import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/auth/guards.dart';
import 'package:medicamina_ui/auth/login/widget.dart';
import 'package:medicamina_ui/auth/not-found/widget.dart';
import 'package:medicamina_ui/auth/password/widget.dart';
import 'package:medicamina_ui/auth/recover/widget.dart';
import 'package:medicamina_ui/auth/register/widget.dart';
import 'package:medicamina_ui/auth/states.dart';
import 'package:medicamina_ui/auth/upgrade/widget.dart';
import 'package:medicamina_ui/auth/widget.dart';

class MedicaminaAuthModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => MedicaminaAuthAppBarLoadingState()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        guards: [MedicaminaAuthGuard()],
        child: (context, args) => const MedicaminaAuthWidget(),
        children: [
          ChildRoute(
            '/login',
            child: (context, args) => const MedicaminaAuthLoginWidget(),
          ),
          ChildRoute(
            '/upgrade',
            child: (context, args) => const MedicaminaAuthUpgradeWidget(),
          ),
          ChildRoute(
            '/register',
            child: (context, args) => const MedicaminaAuthRegisterWidget(),
          ),
          ChildRoute(
            '/password',
            child: (context, args) => const MedicaminaAuthPasswordWidget(),
          ),
          ChildRoute(
            '/recover',
            child: (context, args) => const MedicaminaAuthRecoverWidget(),
          ),
          WildcardRoute(
            child: (context, args) => const MedicaminaAuthNotFoundWidget(),
          ),
        ],
      ),
      RedirectRoute('/auth/login/', to: '/auth/login'),
    ];
  }
}
