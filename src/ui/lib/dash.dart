import 'package:flutter/material.dart'; 
import 'package:community_material_icon/community_material_icon.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}): super(key: key);

  @override
  State<DashboardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
            },
          ),
        ],
        title: const Text("medicamina"),
      ),
      body: Navigator(
        initialRoute: 'dashboard/home',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'dashboard/home': {
              _selectedIndex = 0;
              builder = (BuildContext context) => const Home();
              break;
            }
            case 'dashboard/history': {
              _selectedIndex = 1;
              builder = (BuildContext _) => const History();
              break;
            }
            case 'dashboard/family': {
              _selectedIndex = 2;
              builder = (BuildContext _) => const History();
              break;
            }
            case 'dashboard/account': {
              _selectedIndex = 3;
              builder = (BuildContext _) => const History();
              break;
            }
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.prescription),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.file_tree),
            label: 'Family',
          ),
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.account),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("Home")
      )
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("History")
      )
    );
  }
}

  Widget history() {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("History")
      )
    );
  }

  Widget tree() {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("Tree")
      )
    );
  }

  Widget account() {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("Account")
      )
    );
  }

  Widget error() {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Text("Error")
      )
    );
  }