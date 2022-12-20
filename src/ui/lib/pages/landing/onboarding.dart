import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class MedicaminaOnboardingPage extends StatefulWidget {
  const MedicaminaOnboardingPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaOnboardingPage> createState() => _MedicaminaOnboardingPage();
}

class _MedicaminaOnboardingPage extends State<MedicaminaOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('onboarding');
  }
}