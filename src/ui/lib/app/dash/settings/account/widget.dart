import 'package:flutter/material.dart';
import 'package:medicamina/app/dash/settings/account/desktop.dart';
import 'package:medicamina/app/dash/settings/account/mobile.dart';

class MedicaminaDashSettingsAccountWidget extends StatefulWidget {
  const MedicaminaDashSettingsAccountWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsAccountWidget> createState() => _MedicaminaDashSettingsAccountWidgetState();
}

class _MedicaminaDashSettingsAccountWidgetState extends State<MedicaminaDashSettingsAccountWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    late Widget? widget;
    if (1000 > MediaQuery.of(context).size.width) {
      widget = const MedicaminaDashSettingsAccountMobileWidget();
    } else {
      widget = const MedicaminaDashSettingsAccountDesktopWidget();
    }

    return widget;
  }
}