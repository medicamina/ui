import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:medicamina/app/dash/health/desktop.dart';
import 'package:medicamina/app/dash/health/mobile.dart';

class MedicaminaDashHealthPage extends StatefulWidget {
  const MedicaminaDashHealthPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashHealthPage> createState() => _MedicaminaDashHealthPageState();
}

class _MedicaminaDashHealthPageState extends State<MedicaminaDashHealthPage> {
  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (1000 > MediaQuery.of(context).size.width) {
      widget = const MedicaminaDashHealthMobileWidget();
    } else {
      widget = const MedicaminaDashHealthDesktopWidget();
    }

    return widget;
  }
}
