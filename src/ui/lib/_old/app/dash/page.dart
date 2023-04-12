import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:medicamina/app/appbar.dart';
import 'package:medicamina/main.dart';

class MedicaminaDashPage extends StatefulWidget {
  const MedicaminaDashPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashPage> createState() => _MedicaminaDashPage();
}

class _MedicaminaDashPage extends State<MedicaminaDashPage> {
  late int _currentIndex = -1;

  void setCurrentIndexFromUrl() {
    switch (Modular.args.uri.toString()) {
      case '/dash':
        setState(() {
          _currentIndex = 0;
        });
        break;
      case '/dash/':
        setState(() {
          _currentIndex = 0;
        });
        break;
      case '/dash/home':
        setState(() {
          _currentIndex = 0;
        });
        break;
      case '/dash/edicts':
        setState(() {
          _currentIndex = 1;
        });
        break;
      case '/dash/health':
        setState(() {
          _currentIndex = 2;
        });
        break;
      case '/dash/appointment':
        setState(() {
          _currentIndex = 3;
        });
        break;
      case '/dash/family':
        setState(() {
          _currentIndex = 4;
        });
        break;
      // SETTINGS
      case '/dash/settings':
        setState(() {
          _currentIndex = 5;
        });
        break;
      case '/dash/settings/':
        setState(() {
          _currentIndex = 5;
        });
        break;
      case '/dash/settings/account':
        setState(() {
          _currentIndex = 5;
        });
        break;
      case '/dash/settings/security':
        setState(() {
          _currentIndex = 5;
        });
        break;
      case '/dash/settings/billing':
        setState(() {
          _currentIndex = 5;
        });
        break;
      default:
        Modular.to.navigate('/dash/home');
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    Modular.to.addListener(() {
      setCurrentIndexFromUrl();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Modular.args.uri.toString() == '/dash') {
      Modular.to.navigate('/dash/home');
      return const Center(child: CircularProgressIndicator());
    }
    if (Modular.args.uri.toString() == '/dash/') {
      Modular.to.navigate('/dash/home');
      return const Center(child: CircularProgressIndicator());
    }
    if (Modular.args.uri.toString() == '/dash/settings') {
      Modular.to.navigate('/dash/settings/account');
      return const Center(child: CircularProgressIndicator());
    }
    if (Modular.args.uri.toString() == '/dash/settings/') {
      Modular.to.navigate('/dash/settings/account');
      return const Center(child: CircularProgressIndicator());
    }

    setCurrentIndexFromUrl();

    return Scaffold(
      appBar: Modular.get<MedicaminaAppBarWidget>(),
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.prescription), label: 'Edicts'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.heart_pulse), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.calendar_clock_outline), label: 'Consultation'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.file_tree_outline), label: 'Family'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.cog), label: 'Settings'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Modular.to.pushNamedOrPopUntil('/dash/home');
              break;
            case 1:
              Modular.to.pushNamedOrPopUntil('/dash/edicts');
              break;
            case 2:
              Modular.to.pushNamedOrPopUntil('/dash/health');
              break;
            case 3:
              Modular.to.pushNamedOrPopUntil('/dash/appointment');
              break;
            case 4:
              Modular.to.pushNamedOrPopUntil('/dash/family');
              break;
            case 5:
              if (_currentIndex == index) {
                break;
              }
              Modular.to.pushNamedOrPopUntil('/dash/settings/account');
              break;
          }
        },
      ),
    );
  }
}
