import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicamina/app/States.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:medicamina/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const MedicaminaAppBarWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaAppBarWidget> createState() => _MedicaminaAppBarWidget();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight-6);
}

class _MedicaminaAppBarWidget extends State<MedicaminaAppBarWidget> {
  static bool _loading = Modular.get<MedicaminaAppBarLoadingState>().getLoading();
  static late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = Modular.get<MedicaminaAppBarLoadingState>().getStream().listen((value) {
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
      title: Padding(padding: const EdgeInsets.only(top: 2), child: Text('medicamina', style: GoogleFonts.balooTamma2())),
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
                      Visibility(
                        visible: kIsWeb,
                        child: ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: const Text('Info'),
                          enabled: Modular.args.uri.toString() != '/',
                          onTap: () {
                            Navigator.pop(context);
                            Modular.to.pushNamedOrPopUntil('/');
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.login_outlined),
                        title: const Text('Login'),
                        enabled: Modular.args.uri.toString() != '/login',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.pushNamedOrPopUntil('/login');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_add_outlined),
                        title: const Text('Register'),
                        enabled: Modular.args.uri.toString() != '/register',
                        onTap: () {
                          Navigator.pop(context);
                          Modular.to.pushNamedOrPopUntil('/register');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
          visible: Modular.get<SupabaseClient>().auth.currentSession == null,
        ),
      ],
    );
  }
}
