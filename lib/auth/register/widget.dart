import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

// Medicamina
import 'package:medicamina_ui/auth/states.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaAuthRegisterWidget extends StatefulWidget {
  const MedicaminaAuthRegisterWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaAuthRegisterWidget> createState() => _MedicaminaAuthRegisterWidget();
}

class _MedicaminaAuthRegisterWidget extends State<MedicaminaAuthRegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _passwordVerify = '';
  late bool _loading;
  late StreamSubscription _loadingStream;

  @override
  void initState() {
    super.initState();
    _loading = Modular.get<MedicaminaAuthAppBarLoadingState>().getLoading();
    _loadingStream = Modular.get<MedicaminaAuthAppBarLoadingState>().getStream().listen((value) {
      setState(() {
        _loading = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loadingStream.cancel();
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
                          style: Modular.get<MedicaminaThemeState>().getDarkMode()
                              ? Theme.of(context).textTheme.displayMedium?.merge(const TextStyle(color: Colors.white))
                              : Theme.of(context).textTheme.displayMedium?.merge(
                                    const TextStyle(color: Colors.black87),
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.205 : MediaQuery.of(context).size.width * 0.115),
                        child: Text('Fill out the form to create a new account', style: Theme.of(context).textTheme.displaySmall?.merge(const TextStyle(fontSize: 20))),
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
                    child: AutofillGroup(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Padding(
                            padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                            child: TextFormField(
                              autofillHints: const [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
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
                              autofillHints: const [AutofillHints.password],
                              keyboardType: TextInputType.visiblePassword,
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
                              autofillHints: const [AutofillHints.password],
                              keyboardType: TextInputType.visiblePassword,
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
                              style: ElevatedButton.styleFrom(minimumSize: Size(const Size.fromHeight(40).width, 42), elevation: 0),
                              onPressed: _loading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        Modular.get<MedicaminaAuthAppBarLoadingState>().setLoading(true);
                                        try {
                                          http
                                              .post(
                                            Uri.https('medicamina.azurewebsites.net', 'auth/register'),
                                            headers: <String, String>{
                                              'Content-Type': 'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode({'email': _email, 'password': _password}),
                                          )
                                              .then((response) {
                                                Modular.get<MedicaminaAuthAppBarLoadingState>().setLoading(false);
                                            if (response.statusCode == 200) {
                                              Modular.get<MedicaminaUserState>().login(jsonDecode(response.body)['auth']);
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text(response.body),
                                              ));
                                              Modular.to.navigate('/dash/home');
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
                                            }
                                          });
                                        } catch (e, _) {
                                          print(e);
                                          Modular.get<MedicaminaAuthAppBarLoadingState>().setLoading(false);
                                        }
                                      }
                                    },
                              child: const Text(
                                'REGISTER',
                                style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.75),
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
                                  Modular.to.navigate('/auth/login');
                                },
                                child: const Text(
                                  'Already registered?',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
