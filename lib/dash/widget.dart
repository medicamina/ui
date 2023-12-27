import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicaminaDashWidget extends StatefulWidget {
  const MedicaminaDashWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashWidget> createState() => _MedicaminaDashWidget();
}

class _MedicaminaDashWidget extends State<MedicaminaDashWidget> {
  final uris = [
    '/dash/home',
    '/dash/edicts',
    '/dash/fitness',
    '/dash/appointment',
    '/dash/family',
    '/dash/psychology',
    '/dash/settings'
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

    if (Modular.args.uri.toString() == '/dash/') {
      setState(() {
        _currentIndex = 0;
      });
      Modular.to.navigate('/dash/home');
    }

    if (Modular.args.uri.toString() == '/dash/home/') {
      setState(() {
        _currentIndex = 0;
      });
      Modular.to.navigate('/dash/home');
    }

    if (Modular.args.uri.toString() == '/dash/edicts/') {
      setState(() {
        _currentIndex = 1;
      });
      Modular.to.navigate('/dash/edicts');
    }

    if (Modular.args.uri.toString() == '/dash/fitness/') {
      setState(() {
        _currentIndex = 2;
      });
      Modular.to.navigate('/dash/fitness');
    }

    if (Modular.args.uri.toString() == '/dash/appointment/') {
      setState(() {
        _currentIndex = 3;
      });
      Modular.to.navigate('/dash/appointment');
    }

    if (Modular.args.uri.toString() == '/dash/appointment/booking/') {
      setState(() {
        _currentIndex = 3;
      });
      Modular.to.navigate('/dash/appointment/booking');
    }

    if (Modular.args.uri.toString() == '/dash/family') {
      setState(() {
        _currentIndex = 4;
      });
      Modular.to.navigate('/dash/family/');
    }

    if (Modular.args.uri.toString() == '/dash/psychology') {
      setState(() {
        _currentIndex = 5;
      });
      Modular.to.navigate('/dash/psychology/');
    }

    if (Modular.args.uri.toString() == '/dash/settings') {
      setState(() {
        _currentIndex = 6;
      });
      Modular.to.navigate('/dash/settings/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('medicamina'),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight - 6),
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: _currentIndex == -1
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              enableFeedback: true,
              currentIndex: _currentIndex <= 0 ? 0 : _currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.human), label: 'You'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.prescription),
                    label: 'Edicts'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.heart_pulse),
                    label: 'Fitness'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.calendar_clock_outline),
                    label: 'Appointment'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.file_tree_outline),
                    label: 'Family'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.brain),
                    label: 'Psychology'),
                BottomNavigationBarItem(
                    icon: Icon(CommunityMaterialIcons.cog), label: 'Settings'),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                Modular.to.navigate(uris[index]);
              },
            ),
    );
  }
}
