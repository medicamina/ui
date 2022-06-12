import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

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
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = "";
  String _password = "";

  double height() {
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
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: SizedBox(
                width: 200,
                height: height()
              )
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'First Name'
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
                hintText: 'Last Name'
              ),
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Password'
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Verify Password',
                hintText: 'Verify Password'
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 250,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
                return;
              },
              child: const Text('Register'),
            ),
          ),
          const SizedBox(height: 130),
          TextButton(
            onPressed: () {
              if (NavigationHistoryObserver().history[NavigationHistoryObserver().history.length-1].settings.name == '/register') {
                Navigator.pop(context);
                return;
              }
              Navigator.pushNamed(context, '/register');
              return;
            },
            child: const Text("Already Registered? Login")
          ),
          const SizedBox(height: 30)
        ],
      )
    )
  );
}

Widget login(BuildContext context) {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
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
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: SizedBox(
                width: 200,
                height: height()
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
                hintText: 'Password'
              ),
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
                // if VALID
                Navigator.pushNamed(context, '/dashboard');
                return;
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 130),
          TextButton(
            onPressed: () {
              if (NavigationHistoryObserver().history[NavigationHistoryObserver().history.length-1].settings.name == '/register') {
                Navigator.pop(context);
                return;
              }
              Navigator.pushNamed(context, '/register');
              return;
            },
            child: const Text("New User? Create Account")
          ),
          const SizedBox(height: 30)
        ]
      )
    )
  );
}

