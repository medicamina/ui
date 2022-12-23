import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/app/auth/States.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MedicaminaAuthAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const MedicaminaAuthAppBarWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaAuthAppBarWidget> createState() => _MyWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyWidgetState extends State<MedicaminaAuthAppBarWidget> {
  bool _loading = Modular.get<MedicaminaAuthLoadingState>().getLoading();
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
   _streamSubscription = Modular.get<MedicaminaAuthLoadingState>().getStream().listen((value) {
      setState(() {
        _loading = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                          title: const Text('Info'),
                          onTap: () {
                            // if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/') {
                            //   return;
                            // }

                            // var history_1 = Beamer.of(context).beamingHistory;
                            // var history_2 = history_1[history_1.length - 1].history;
                            // if (history_2.length >= 2) {
                            //   if (history_2[history_2.length - 2].routeInformation.location == '/') {
                            //     Beamer.of(context).popToNamed('/', stacked: false);
                            //     return;
                            //   }
                            // }

                            // Beamer.of(context).beamToNamed('/');
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.login_outlined),
                        title: const Text('Login'),
                        onTap: () {
                          // if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/login') {
                          //   return;
                          // }

                          // var history_1 = Beamer.of(context).beamingHistory;
                          // var history_2 = history_1[history_1.length - 1].history;
                          // if (history_2.length >= 2) {
                          //   if (history_2[history_2.length - 2].routeInformation.location == '/login') {
                          //     Beamer.of(context).popToNamed('/login', stacked: false);
                          //     return;
                          //   }
                          // }

                          // Beamer.of(context).beamToNamed('/login');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_add_outlined),
                        title: const Text('Register'),
                        onTap: () {
                          // if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/register') {
                          //   return;
                          // }

                          // var history_1 = Beamer.of(context).beamingHistory;
                          // var history_2 = history_1[history_1.length - 1].history;
                          // if (history_2.length >= 2) {
                          //   if (history_2[history_2.length - 2].routeInformation.location == '/register') {
                          //     Beamer.of(context).popToNamed('/register', stacked: false);
                          //     return;
                          //   }
                          // }

                          // Beamer.of(context).beamToNamed('/register');
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
    );
  }
}