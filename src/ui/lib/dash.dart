import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:event/event.dart';
import 'dash/home.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.beamerKey, required this.eventBack}) : super(key: key);

  final GlobalKey<BeamerState> beamerKey;
  final Event eventBack;

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

  void updateIndex() {
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
  void initState() {
    super.initState();
    widget.eventBack.subscribe((args) => updateIndex());
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
    updateIndex();
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
        _beamerDelegate.beamToNamed(pages[index], replaceRouteInformation: true, beamBackOnPop: true);
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
  MedicaminaDashboardPage({Key? key}) : super(key: key);

  final _eventBack = Event();

  @override
  State<StatefulWidget> createState() => _MedicaminaDashboardPageState();
}

class _MedicaminaDashboardPageState extends State<MedicaminaDashboardPage> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('medicamina'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            var length = _beamerKey.currentState!.routerDelegate.beamingHistory[0].history.length;
            var location = _beamerKey.currentState!.routerDelegate.beamingHistory[0].history[length - 1].routeInformation.location;
            if (length > 1) {
              _beamerKey.currentState!.routerDelegate.beamBack();
            }
            if (length == 1) {
              if (location != '/dashboard') {
                _beamerKey.currentState!.routerDelegate.beamToNamed('/dashboard');
              }
            }
            widget._eventBack.broadcast();
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
              '/dashboard': (p0, p1, p2) => Home(),
              '/dashboard/history': (p0, p1, p2) => const Text("History"),
              '/dashboard/family': (p0, p1, p2) => const Text("Family"),
              '/dashboard/account': (p0, p1, p2) => const Text("Account"),
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(beamerKey: _beamerKey, eventBack: widget._eventBack),
    );
  }
}
