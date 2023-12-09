import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicaminaNotFoundWidget extends StatelessWidget {
  const MedicaminaNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight - 6),
        child: AppBar(
          title: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text('medicamina', style: GoogleFonts.balooTamma2())),
          centerTitle: true,
          actions: [
            Visibility(
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Center(child: Text('Navigate')),
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
                                Modular.to.navigate('/');
                              },
                            ),
                          ),
                          Visibility(
                            visible: Modular.get<SupabaseClient>()
                                    .auth
                                    .currentUser ==
                                null,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.login_outlined),
                                  title: const Text('Login'),
                                  enabled: Modular.args.uri.toString() !=
                                      '/auth/login',
                                  onTap: () {
                                    Navigator.pop(context);
                                    Modular.to.navigate('/auth/login');
                                  },
                                ),
                                ListTile(
                                  leading:
                                      const Icon(Icons.person_add_outlined),
                                  title: const Text('Register'),
                                  enabled: Modular.args.uri.toString() !=
                                      '/auth/register',
                                  onTap: () {
                                    Navigator.pop(context);
                                    Modular.to.navigate('/auth/register');
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.lock_open),
                                  title: const Text('Reset password'),
                                  enabled: Modular.args.uri.toString() !=
                                      '/auth/password',
                                  onTap: () {
                                    Navigator.pop(context);
                                    Modular.to.navigate('/auth/password');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: Modular.get<SupabaseClient>()
                                    .auth
                                    .currentUser !=
                                null,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.home),
                                  title: const Text('Dashboard'),
                                  enabled: Modular.args.uri.toString() !=
                                      '/dash/home',
                                  onTap: () {
                                    Navigator.pop(context);
                                    Modular.to.navigate('/dash/home');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.menu),
              ),
              // visible: Modular.get<SupabaseClient>().auth.currentSession == null,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  Text(
                    'ERROR',
                    style: Theme.of(context).textTheme.displaySmall?.apply(
                        heightDelta: 0,
                        heightFactor: 0,
                        color: Theme.of(context).textTheme.bodySmall?.color),
                  ),
                  Text(
                    '404',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.apply(heightDelta: 0, heightFactor: 0),
                  ),
                  Text(
                    'Page not found',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.apply(heightDelta: 0, heightFactor: 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
