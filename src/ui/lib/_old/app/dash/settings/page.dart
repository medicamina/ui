import 'package:flutter/material.dart';
import 'package:medicamina/app/dash/settings/desktop.dart';
import 'package:medicamina/app/dash/settings/mobile.dart';

class MedicaminaDashSettingsPage extends StatelessWidget {
  const MedicaminaDashSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (1000 > MediaQuery.of(context).size.width) {
      widget = const MedicaminaDashSettingsMobileWidget();
    } else {
      widget = const MedicaminaDashSettingsDesktopWidget();
    }

    return Scaffold(body: widget);
  }
}
