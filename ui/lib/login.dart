import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
    Widget build(BuildContext context) {
    var routePath = ModalRoute.of(context)?.settings.name;
    switch (routePath) {
      case '/login': return login(context);
      case '/register': return register(context);
      default: return login(context);
    }
  }
}

Widget register(BuildContext context) {
  return SafeArea(child: 
    Scaffold(
      appBar: AppBar(
        title: const Text("medicamina"),
      ),
      body: const SingleChildScrollView(

      )
    )
  );
}

Widget login(BuildContext context) {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150
                )
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Email'
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0, 
                right: 15.0,
                top: 15,
                bottom: 0
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Password'),
              ),
            ),
            TextButton(
              onPressed:() {
                return;
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: OutlinedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text('Login',),
              ),
            ),
            const SizedBox(height: 130),
            const Text('New User? Create Account'),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
}

