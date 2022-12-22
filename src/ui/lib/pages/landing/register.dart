import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:medicamina/globals.dart' as globals;

final supabase = Supabase.instance.client;

class MedicaminaRegisterPage extends StatefulWidget {
  const MedicaminaRegisterPage({
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
  State<MedicaminaRegisterPage> createState() => _MedicaminaRegisterPage();
}

class _MedicaminaRegisterPage extends State<MedicaminaRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _passwordVerify = "";
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
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.1, top: 24),
                        child: Text(
                          "Let's get started",
                          style: globals.darkMode
                              ? Theme.of(context).textTheme.displayMedium?.merge(const TextStyle(color: Colors.white))
                              : Theme.of(context).textTheme.displayMedium?.merge(
                                    const TextStyle(color: Colors.black87),
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.205 : MediaQuery.of(context).size.width * 0.115),
                        child: Text("Fill out the form to create a new account", style: Theme.of(context).textTheme.displaySmall?.merge(const TextStyle(fontSize: 20))),
                      ),
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
                              // hintText: 'Email',
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
                        const SizedBox(height: 12),
                        Padding(
                          padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Verify password',
                              prefixIcon: Icon(Icons.done),
                            ),
                            onChanged: (text) {
                              _passwordVerify = text;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Empty password';
                              }
                              if (_password != _passwordVerify) {
                                return 'Passwords do not match';
                              }
                              if (_password.length < 6) {
                                return 'Password must be more than 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(40),
                            ),
                            onPressed: _loading
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      widget.loadingCallback(true);
                                      try {
                                        await supabase.auth.signUp(email: _email, password: _password);

                                        widget.snackBarNormal('Please check your e-mails for a verificaiton link');
                                        widget.loadingCallback(false);

                                        widget.beamerKey.currentState!.routerDelegate.beamToNamed('/login');
                                      } on AuthException catch (err, _) {
                                        widget.snackBarError(err);
                                        widget.loadingCallback(false);
                                      }
                                    }
                                  },
                            child: const Text(
                              'REGISTER',
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
                                if (Beamer.of(context).currentBeamLocation.state.routeInformation.location == '/login') {
                                  return;
                                }

                                var history_1 = Beamer.of(context).beamingHistory;
                                var history_2 = history_1[history_1.length - 1].history;
                                if (history_2.length >= 2) {
                                  if (history_2[history_2.length - 2].routeInformation.location == '/login') {
                                    Beamer.of(context, root: true).popToNamed('/login', stacked: false);
                                    return;
                                  }
                                }

                                Beamer.of(context, root: true).beamToNamed('/login');
                              },
                              child: const Text(
                                'Already registered?',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
