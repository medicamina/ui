import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:medicamina/globals.dart';

final supabase = Supabase.instance.client;


Widget login(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  double height() {
    var _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    if (_keyboardVisible) {
      return 50;
    }
    return 150;
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text("login"),
    ),
    body: LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Center(
                              child: SizedBox(width: 200, height: height()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Email',
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Password',
                              ),
                              onChanged: (text) {
                                _password = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty password';
                                }
                                if (_password.length < 6) {
                                  'Password must be more than 6 characters';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              return;
                            },
                            child: const Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: OutlinedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final AuthResponse res = await supabase.auth.signInWithPassword(
                                    email: _email,
                                    password: _password
                                  );

                                  if (res.session != null) {
                                    Beamer.of(context).beamToNamed('/dashboard');
                                  }
                                }
                              },
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Beamer.of(context).beamToNamed('/register');
                        },
                        child: const Text("New User? Create Account"),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
