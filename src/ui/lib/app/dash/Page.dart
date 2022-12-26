import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:medicamina/app/AppBar.dart';
import 'package:medicamina/main.dart';
import 'dart:html' as html;

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
      case '/dash/home':
        setState(() {
          _currentIndex = 0;
        });
        break;
      case '/dash/history':
        setState(() {
          _currentIndex = 1;
        });
        break;
      case '/dash/order':
        setState(() {
          _currentIndex = 2;
        });
        break;
      case '/dash/family':
        setState(() {
          _currentIndex = 3;
        });
        break;
      case '/dash/settings':
        setState(() {
          _currentIndex = 4;
        });
        break;
      case '/dash/settings/overview':
        setState(() {
          _currentIndex = 4;
        });
        break;
      case '/dash/settings/security':
        setState(() {
          _currentIndex = 4;
        });
        break;
      case '/dash/settings/profile':
        setState(() {
          _currentIndex = 4;
        });
        break;
      case '/dash/settings/subscription':
        setState(() {
          _currentIndex = 4;
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
    if (Modular.args.uri.toString() == '/dash/') {
      Modular.to.navigate('/dash/home');
      return const Center(child: CircularProgressIndicator());
    }
    if (Modular.args.uri.toString() == '/dash/settings/') {
      Modular.to.navigate('/dash/settings/overview');
      return const Center(child: CircularProgressIndicator());
    }
    setCurrentIndexFromUrl();

    return Scaffold(
      appBar: Modular.get<MedicaminaAppBarWidget>(),
      // appBar: AppBar(
      //   title: Text('medicamina', style: GoogleFonts.balooTamma2()),
      //   centerTitle: true,
      //   leading: Visibility(
      //     visible: Modular.to.canPop(),
      //     child: IconButton(
      //       icon: const Icon(Icons.arrow_back),
      //       onPressed: () {},
      //     ),
      //   ),
      // ),
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.prescription), label: 'Edicts'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.cash), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.file_tree), label: 'Family'),
          BottomNavigationBarItem(icon: Icon(CommunityMaterialIcons.cog), label: 'Settings'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Modular.to.pushNamedOrPopUntil('/dash/home');
              break;
            case 1:
              Modular.to.pushNamedOrPopUntil('/dash/history');
              break;
            case 2:
              Modular.to.pushNamedOrPopUntil('/dash/order');
              break;
            case 3:
              Modular.to.pushNamedOrPopUntil('/dash/family');
              break;
            case 4:
              if (_currentIndex == index) {
                break;
              }
              Modular.to.pushNamedOrPopUntil('/dash/settings/overview');
              break;
          }
        },
      ),
    );
  }
}
