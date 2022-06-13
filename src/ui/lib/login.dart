import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MedicaminaLoginPage extends StatefulWidget {
  const MedicaminaLoginPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaLoginPage> createState() => _MedicaminaLoginPageState();
}

class _MedicaminaLoginPageState extends State<MedicaminaLoginPage> {
  @override
  Widget build(BuildContext context) {
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    switch (beamState.uri.toString()) {
      case '/login':
        return login(context);
      case '/register':
        return register(context);
      default:
        return login(context);
    }
  }
}

Widget register(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String _fname = "";
  String _lname = "";
  String _email = "";
  String _email_verify = "";
  String _password = "";
  String _password_verify = "";
  ScrollController _scrollController = ScrollController();

  double height() {
    if (MediaQuery.of(context).size.height <= 700) {
      return 0; 
    }
    var _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    if (_keyboardVisible) {
      return 50;
    }
    return 100;
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text("Create Account"),
    ),
    body: LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          controller: _scrollController,
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
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First name',
                                hintText: 'First name',
                              ),
                              onChanged: (text) {
                                _fname = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty first name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last name',
                                hintText: 'Last name',
                              ),
                              onChanged: (text) {
                                _lname = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty last name';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Verify Email',
                                hintText: 'Verify Email',
                              ),
                              onChanged: (text) {
                                _email_verify = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty email';
                                }
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                                if (!emailValid) {
                                  return 'Invalid email';
                                }
                                if (_email != _email_verify) {
                                  return 'Mismatched email';
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
                                labelText: 'Verify password',
                                hintText: 'Verify password',
                              ),
                              onChanged: (text) {
                                _password_verify = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Empty password';
                                }
                                if (_password != _password) {
                                  return 'Mismatched passwords';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            width: 250,
                            child: OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Beamer.of(context).beamToNamed('/dashboard');
                                }
                              },
                              child: const Text('Register'),
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
                          Beamer.of(context).beamToNamed('/login');
                        },
                        child: const Text("Already Registered? Login"),
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
      title: const Text("Login Page"),
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Beamer.of(context).beamToNamed('/dashboard');
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
