import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/pages/auth/onboarding.dart';
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
  final _authScaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  bool? loadingCallbackFunc(bool? val) {
    if (val != null) {
      setState(() {
        _loading = val;
      });
      return null;
    }
    return _loading;
  }

  void snackBarErrorFunc(AuthException err) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width - 20,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        content: Text(err.message),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }

  void snackBarNormalFunc(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width - 20,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _beamerKey = GlobalKey<BeamerState>();

    if (supabase.auth.currentSession != null) {
      return const MedicaminaAuthRedirect();
    }

    return Scaffold(
      key: _authScaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('medicamina', style: GoogleFonts.balooTamma2()),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: _loading ? const Size.fromHeight(6.0) : const Size.fromHeight(0),
          child: Visibility(
            child: LinearProgressIndicator(
              backgroundColor: Colors.red.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            visible: _loading,
          ),
        ),
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: BeamerDelegate(
          setBrowserTabTitle: false,
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/login': (context, state, data) => Login(
                    loadingCallback: loadingCallbackFunc,
                    snackBarError: snackBarErrorFunc,
                    snackBarNormal: snackBarNormalFunc,
                    beamerKey: _beamerKey,
                  ),
              '/register': (context, state, data) => Register(
                    loadingCallback: loadingCallbackFunc,
                    snackBarError: snackBarErrorFunc,
                    snackBarNormal: snackBarNormalFunc,
                    beamerKey: _beamerKey,
                  ),
              '/onboarding': (context, state, data) => const Onboarding(),
            },
          ),
        ),
      ),
    );
  }
}
