import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:medicamina/globals.dart' as globals;

final supabase = Supabase.instance.client;

class MedicaminaLoginPage extends StatefulWidget {
  const MedicaminaLoginPage({
    Key? key,
    required this.loadingCallback,
    required this.snackBarError,
    required this.snackBarNormal,
    required this.beamerKey,
  }) : super(key: key);

  final Function(bool? val) loadingCallback;
  final Function(AuthException err) snackBarError;
  final Function(String message) snackBarNormal;
  final GlobalKey<BeamerState> beamerKey;

  @override
  State<MedicaminaLoginPage> createState() => _MedicaminaLoginPage();
}

class _MedicaminaLoginPage extends State<MedicaminaLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  late bool _loading;

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = widget.loadingCallback(null);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.1, top: 24),
                          child: Text(
                            "Welcome",
                            style: globals.darkMode
                                ? Theme.of(context).textTheme.displayMedium?.merge(const TextStyle(color: Colors.white))
                                : Theme.of(context).textTheme.displayMedium?.merge(
                                      const TextStyle(color: Colors.black87),
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.205 : MediaQuery.of(context).size.width * 0.115),
                          child: Text("Sign in to continue", style: Theme.of(context).textTheme.displaySmall?.merge(const TextStyle(fontSize: 20))),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            Padding(
                              padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'E-mail address',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                onChanged: (text) {
                                  _email = text;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Empty email';
                                  }
                                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                                  if (!emailValid) {
                                    return 'Invalid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                                onChanged: (text) {
                                  _password = text;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Empty password';
                                  }
                                  if (_password.length < 6) {
                                    return 'Invalid password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 18),
                            Padding(
                              padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                                onPressed: _loading
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          widget.loadingCallback(true);
                                          try {
                                            await supabase.auth.signInWithPassword(email: _email, password: _password);
                                          } on AuthException catch (err, _) {
                                            widget.snackBarError(err);
                                          }
                                          widget.loadingCallback(false);
                                        }
                                      },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.75),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
                                  ),
                                  onPressed: () {
                                    Beamer.of(context, root: true).beamToNamed('/password');
                                  },
                                  child: const Text(
                                    'Reset password',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}
