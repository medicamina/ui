import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:beamer/beamer.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('app_title home page')),
      body: Column(
        children: [
          const Text("Welcome to the app"),
          TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/login');
            },
            child: const Text("Go to login page"),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('app_title login page')),
      body: Column(
        children: [
          const Text("Press button to login"),
          TextButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/dashboard');
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.beamerKey}) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var pages = ['/dashboard', '/dashboard/history', '/dashboard/family', '/dashboard/account'];
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _updateCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
    final beamState = _beamerDelegate.currentBeamLocation.state as BeamState;
    final path = beamState.pathPatternSegments[beamState.pathPatternSegments.length-1];
    switch (path) {
      case 'dashboard': return _updateCurrentIndex(0);
      case 'history': return _updateCurrentIndex(1);
      case 'family': return _updateCurrentIndex(2);
      case 'account': return _updateCurrentIndex(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.prescription), label: 'History'),
        BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.file_tree), label: 'Family'),
        BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.account), label: 'Account'),
      ],
      onTap: (index) {
        _beamerDelegate.update(configuration: RouteInformation(location: pages[index]));
        _updateCurrentIndex(index);
      },
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app_title dashboard'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _beamerKey.currentState!.routerDelegate.beamBack();
            },
          ), 
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: BeamerDelegate(
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/dashboard': (p0, p1, p2) => const Text("Home"),
              '/dashboard/history': (p0, p1, p2) => const Text("History"),
              '/dashboard/family': (p0, p1, p2) => const Text("Family"),
              '/dashboard/account': (p0, p1, p2) => const Text("Account"),
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        beamerKey: _beamerKey,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const DefaultPage(),
        '/login': (context, state, data) => const LoginPage(),
        '/dashboard': (context, state, data) => const DashboardPage(),
        '/dashboard/*': (context, state, data) => const DashboardPage(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'app_title',
      theme: ThemeData(),
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _routerDelegate),
    );
  }
}
