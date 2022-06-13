import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

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
    final path = beamState.pathPatternSegments[beamState.pathPatternSegments.length - 1];
    switch (path) {
      case 'dashboard':
        return _updateCurrentIndex(0);
      case 'history':
        return _updateCurrentIndex(1);
      case 'family':
        return _updateCurrentIndex(2);
      case 'account':
        return _updateCurrentIndex(3);
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

class MedicaminaDashboardPage extends StatefulWidget {
  const MedicaminaDashboardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicaminaDashboardPageState();
}

class _MedicaminaDashboardPageState extends State<MedicaminaDashboardPage> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app_title dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: Add beam to history
            _beamerKey.currentState!.routerDelegate.beamBack();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              // TODO: popup for notifications
            },
          ),
        ],
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
