import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class MedicaminaAuthRedirect extends StatelessWidget {
  const MedicaminaAuthRedirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Beamer.of(context).beamToNamed('/dashboard');
    });
    return const Center(child: CircularProgressIndicator());
  }
}
