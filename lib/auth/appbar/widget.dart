import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/auth/states.dart';

class MedicaminaAuthAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const MedicaminaAuthAppBarWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaAuthAppBarWidget> createState() =>
      _MedicaminaAuthAppBarWidget();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 6);
}

class _MedicaminaAuthAppBarWidget extends State<MedicaminaAuthAppBarWidget> {
  static bool _loading =
      Modular.get<MedicaminaAuthAppBarLoadingState>().getLoading();
  static late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = Modular.get<MedicaminaAuthAppBarLoadingState>()
        .getStream()
        .listen((value) {
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
      title: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text('medicamina', style: GoogleFonts.balooTamma2())),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize:
            _loading ? const Size.fromHeight(6.0) : const Size.fromHeight(0),
        child: Visibility(
          visible: _loading,
          child: LinearProgressIndicator(
            backgroundColor: Colors.red.withOpacity(0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ),
      actions: [
        Visibility(
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Center(child: Text('Navigation')),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Visibility(
                      //   visible: kIsWeb,
                      //   child:

                      ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: const Text('Info'),
                        enabled: Modular.args.uri.toString() != '/',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.navigate('/');
                        },
                      ),
                      // ),
                      ListTile(
                        leading: const Icon(Icons.login_outlined),
                        title: const Text('Login'),
                        enabled: Modular.args.uri.toString() != '/auth/login',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.navigate('/auth/login');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_add_outlined),
                        title: const Text('Register'),
                        enabled:
                            Modular.args.uri.toString() != '/auth/register',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.navigate('/auth/register');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock_open),
                        title: const Text('Reset password'),
                        enabled:
                            Modular.args.uri.toString() != '/auth/password',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.navigate('/auth/password');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
