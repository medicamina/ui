import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/pages/landing/login.dart';
import 'package:medicamina/pages/landing/onboarding.dart';
import 'package:medicamina/pages/landing/password.dart';
import 'package:medicamina/pages/landing/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:medicamina/pages/landing/marketing.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final supabase = Supabase.instance.client;

class MedicaminaLandingPage extends StatefulWidget {
  const MedicaminaLandingPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaLandingPage> createState() => _MedicaminaLandingPage();
}

class _MedicaminaLandingPage extends State<MedicaminaLandingPage> {
  final _beamerKey = GlobalKey<BeamerState>();
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
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          child: IconButton(
            icon: const BackButtonIcon(),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
          visible: Beamer.of(context).canBeamBack,
        ),
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
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Center(child: Text('Navigation')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: kIsWeb,
                        child: ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: const Text('Information'),
                          onTap: () {
                            if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/') {
                              return;
                            }
                            var history_1 = Beamer.of(context).beamingHistory;
                            var history_2 = history_1[history_1.length - 1].history;
                            if (history_2.length >= 2) {
                              if (history_2[history_2.length - 2].routeInformation.location == '/') {
                                Beamer.of(context).popToNamed('/', stacked: false);
                                return;
                              }
                            }
                            Beamer.of(context).beamToNamed('/');
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.login_outlined),
                        title: const Text('Login'),
                        onTap: () {
                          if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/login') {
                            return;
                          }

                          var history_1 = Beamer.of(context).beamingHistory;
                          var history_2 = history_1[history_1.length - 1].history;
                          if (history_2.length >= 2) {
                            if (history_2[history_2.length - 2].routeInformation.location == '/login') {
                              Beamer.of(context).popToNamed('/login', stacked: false);
                              return;
                            }
                          }

                          Beamer.of(context).beamToNamed('/login');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_add_outlined),
                        title: const Text('Register'),
                        onTap: () {
                          if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/register') {
                            return;
                          }

                          var history_1 = Beamer.of(context).beamingHistory;
                          var history_2 = history_1[history_1.length - 1].history;
                          if (history_2.length >= 2) {
                            if (history_2[history_2.length - 2].routeInformation.location == '/register') {
                              Beamer.of(context).popToNamed('/register', stacked: false);
                              return;
                            }
                          }

                          Beamer.of(context).beamToNamed('/register');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: BeamerDelegate(
          setBrowserTabTitle: false,
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/': (context, state, data) => const MedicaminaMarketingPage(),
              '/login': (context, state, data) => MedicaminaLoginPage(
                    loadingCallback: loadingCallbackFunc,
                    snackBarError: snackBarErrorFunc,
                    snackBarNormal: snackBarNormalFunc,
                    beamerKey: _beamerKey,
                  ),
              '/register': (context, state, data) => MedicaminaRegisterPage(
                    loadingCallback: loadingCallbackFunc,
                    snackBarError: snackBarErrorFunc,
                    snackBarNormal: snackBarNormalFunc,
                    beamerKey: _beamerKey,
                  ),
              '/onboarding': (context, state, data) => const MedicaminaOnboardingPage(),
              '/password': (context, state, data) => const MedicaminaPasswordResetPage(),
            },
          ),
        ),
      ),
    );
  }
}
