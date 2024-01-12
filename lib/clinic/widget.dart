import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaClinicWidget extends StatefulWidget {
  const MedicaminaClinicWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaClinicWidget> createState() => _MedicaminaClinicWidget();
}

class _MedicaminaClinicWidget extends State<MedicaminaClinicWidget> {
  final uris = [
    '/clinic/apppointments',
    '/clinic/prescribe',
    '/clinic/settings',
  ];
  late int _currentIndex = -1;

  @override
  void initState() {
    super.initState();

    Modular.to.addListener(() {
      for (var i = 0; i < uris.length; i++) {
        if (Modular.args.uri.toString().contains(uris[i])) {
          setState(() {
            _currentIndex = i;
          });
          break;
        }
      }
    });

    for (var i = 0; i < uris.length; i++) {
      if (Modular.args.uri.toString().contains(uris[i])) {
        setState(() {
          _currentIndex = i;
        });
        break;
      }
    }

    if (Modular.args.uri.toString() == '/clinic/') {
      setState(() {
        _currentIndex = 0;
      });
      Modular.to.navigate('/clinic/appointments');
    }

    if (Modular.args.uri.toString() == '/clinic/prescribe/') {
      setState(() {
        _currentIndex = 1;
      });
      Modular.to.navigate('/clinic/prescribe');
    }

    if (Modular.args.uri.toString() == '/clinic/settings/') {
      setState(() {
        _currentIndex = 2;
      });
      Modular.to.navigate('/clinic/settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight - 6),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text('medicamina'),
          ),
        ),
      ),
      body: const RouterOutlet(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Appointments'),
              selected: _currentIndex == 0,
              onTap: () {
                // Update the state of the app
                setState(() {
                  _currentIndex = 0;
                });
                // Then close the drawer
                Navigator.pop(context);
                Modular.to.navigate('/clinic/appointments');
              },
            ),
            ListTile(
              title: const Text('Prescribe'),
              selected: _currentIndex == 1,
              onTap: () {
                // Update the state of the app
                setState(() {
                  _currentIndex = 1;
                });
                // Then close the drawer
                Navigator.pop(context);
                Modular.to.navigate('/clinic/prescribe');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _currentIndex == 2,
              onTap: () {
                // Update the state of the app
                setState(() {
                  _currentIndex = 2;
                });
                // Then close the drawer
                Navigator.pop(context);
                Modular.to.navigate('/clinic/settings');
              },
            ),
            ListTile(
              title: const Text('Patient view'),
              selected: _currentIndex == 3,
              onTap: () {
                // Update the state of the app
                setState(() {
                  _currentIndex = 3;
                });
                // Then close the drawer
                Navigator.pop(context);
                Modular.to.navigate('/dash/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
