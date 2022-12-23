import 'package:flutter/material.dart';
import 'package:medicamina/globals.dart' as globals;
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class MedicaminaPasswordResetPage extends StatefulWidget {
  const MedicaminaPasswordResetPage({
    Key? key,
    required this.snackBarError,
    required this.snackBarNormal,
    required this.loadingCallback,
  }) : super(key: key);

  final Function(bool? val) loadingCallback;
  final Function(AuthException err) snackBarError;
  final Function(String message) snackBarNormal;

  @override
  State<MedicaminaPasswordResetPage> createState() => _MedicaminaPasswordResetPage();
}

class _MedicaminaPasswordResetPage extends State<MedicaminaPasswordResetPage> {
  String _email = "";
  final _formKey = GlobalKey<FormState>();

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
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.2 : MediaQuery.of(context).size.width * 0.1, top: 24),
                      child: Text(
                        "Reset password",
                        style: globals.darkMode
                            ? Theme.of(context).textTheme.displayMedium?.merge(const TextStyle(color: Colors.white))
                            : Theme.of(context).textTheme.displayMedium?.merge(
                                  const TextStyle(color: Colors.black87),
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? MediaQuery.of(context).size.width * 0.205 : MediaQuery.of(context).size.width * 0.115),
                      child: Text("Enter your e-mail address to get your account back", style: Theme.of(context).textTheme.displaySmall?.merge(const TextStyle(fontSize: 20))),
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
                              setState(() {
                                _email = text;
                              });
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
                        const SizedBox(height: 18),
                        Padding(
                          padding: MediaQuery.of(context).size.width > 800 ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20, right: MediaQuery.of(context).size.width * 0.2) : const EdgeInsets.only(left: 24, right: 24),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(minimumSize: Size(const Size.fromHeight(40).width, 42)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                widget.loadingCallback(true);
                                try {
                                  await supabase.auth.resetPasswordForEmail(_email);
                                  widget.snackBarNormal('Check your e-mails');
                                } on AuthException catch (err, _) {
                                  widget.snackBarError(err);
                                }
                                widget.loadingCallback(false);
                              }
                            },
                            child: const Text(
                              'SEND LINK',
                              style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.75),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
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
