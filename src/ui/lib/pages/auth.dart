import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:medicamina/pages/auth/redirect.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:medicamina/pages/auth/register.dart';
import 'package:medicamina/pages/auth/login.dart';

final supabase = Supabase.instance.client;

class MedicaminaAuthPage extends StatefulWidget {
  const MedicaminaAuthPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaAuthPage> createState() => _MedicaminaAuthPageState();
}

class _MedicaminaAuthPageState extends State<MedicaminaAuthPage> {
  @override
  Widget build(BuildContext context) {
    // already logged in
    if (supabase.auth.currentSession != null) {
      return const MedicaminaAuthRedirect();
    }

    // no session
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    switch (beamState.uri.toString()) {
      case '/login':
        return login(context);
      case '/register':
        return register(context);
      default:
        return login(context);
    }
  }
}
