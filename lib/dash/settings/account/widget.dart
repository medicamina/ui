import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/dash/settings/account/desktop.dart';
import 'package:medicamina_ui/dash/settings/account/mobile.dart';

class MedicaminaDashSettingsAccountWidget extends StatelessWidget {
  const MedicaminaDashSettingsAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Modular.args.uri.toString() == '/dash/settings/') {
      Modular.to.navigate('/dash/settings/account');
    }
    if (1000 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsAccountMobileWidget();
    }
    return const MedicaminaDashSettingsAccountDesktopWidget();
  }
}
