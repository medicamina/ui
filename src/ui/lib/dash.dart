import 'dart:html';

import 'package:badges/badges.dart';
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
  final pages = ['/dashboard', '/dashboard/history', '/dashboard/family', '/dashboard/account'];
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
        var length = _beamerDelegate.beamingHistory[0].history.length;
        var currentLocation = _beamerDelegate.beamingHistory[0].history[length - 1].routeInformation.location;
        var newLocation = pages[index];
        if (currentLocation == newLocation) {
          return;
        }

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

  final _eventBack = Event<Value<int>>();

  @override
  State<StatefulWidget> createState() => _MedicaminaDashboardPageState();
}

enum DoctorType { pharmacist, doctor, surgeon }

class Notificaton {
  DoctorType type;
  String name;
  String message;
  bool? read;
  Notificaton(this.name, this.message, this.type, {this.read = false});
}

class _MedicaminaDashboardPageState extends State<MedicaminaDashboardPage> {
  final _beamerKey = GlobalKey<BeamerState>();
  int notificationValue = -1;

  var notifications = <Notificaton>[
    Notificaton('Dr. Amber Smith', 'Script instructions updated', DoctorType.doctor),
    Notificaton('Surg. Garry Roberts', 'Surgery report updated', DoctorType.surgeon),
    Notificaton('Pharm. Alex Pascal', 'Script refills updated', DoctorType.pharmacist),
    Notificaton('Dr. Amber Smith', 'Script instructions updated', DoctorType.doctor),
    Notificaton('Surg. Garry Roberts', 'Surgery report updated', DoctorType.surgeon),
    Notificaton('Pharm. Alex Pascal', 'Script refills updated', DoctorType.pharmacist),
    Notificaton('Dr. Amber Smith', 'Script instructions updated', DoctorType.doctor),
    Notificaton('Surg. Garry Roberts', 'Surgery report updated', DoctorType.surgeon),
    Notificaton('Pharm. Alex Pascal', 'Script refills updated', DoctorType.pharmacist),
    Notificaton('Dr. Amber Smith', 'Script instructions updated', DoctorType.doctor),
    Notificaton('Surg. Garry Roberts', 'Surgery report updated', DoctorType.surgeon),
    Notificaton('Pharm. Alex Pascal', 'Script refills updated', DoctorType.pharmacist),
    Notificaton('Dr. Amber Smith', 'Script instructions updated', DoctorType.doctor),
    Notificaton('Surg. Garry Roberts', 'Surgery report updated', DoctorType.surgeon),
    Notificaton('Pharm. Alex Pascal', 'Script refills updated', DoctorType.pharmacist),
  ];

  void getNotificationCount() {
    int val = 0;
    for (var i = 0; i < notifications.length; i++) {
      if (notifications[i].read == false) {
        val += 1;
      }
    }
    setState(() {
      notificationValue = val;
    });
  }

  void resetNotificatonCount() {
    for (var i = 0; i < notifications.length; i++) {
      notifications[i].read = true;
    }
    getNotificationCount();
  }

  @override
  void initState() {
    super.initState();
    getNotificationCount();
  }

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
          Badge(
            position: BadgePosition.topStart(top: -1, start: -1),
            badgeContent: Text(notificationValue.toString(), style: const TextStyle(color: Colors.white)),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Notifications'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: notifications
                              .map(
                                (e) => ListTile(
                                  // Doctor
                                  leading: e.type == DoctorType.doctor
                                      ? const Icon(CommunityMaterialIcons.doctor)
                                      // Pharmacist
                                      : e.type == DoctorType.pharmacist
                                          ? const Icon(CommunityMaterialIcons.pill)
                                          // Surgeon
                                          : e.type == DoctorType.surgeon
                                              ? const Icon(CommunityMaterialIcons.face_mask)
                                              // Error
                                              : const Icon(Icons.error),
                                  title: Text(e.name),
                                  subtitle: Text(e.message),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Mark as seen'),
                          onPressed: () {
                            resetNotificatonCount(); // WHY BUG?!?!?
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Beamer(
        key: _beamerKey,
        routerDelegate: BeamerDelegate(
          setBrowserTabTitle: false,
          initialPath: '/dashboard',
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/dashboard': (p0, p1, p2) => const Home(),
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
