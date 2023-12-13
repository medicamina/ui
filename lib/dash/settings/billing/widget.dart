import 'package:flutter/material.dart';
import 'package:medicamina_ui/dash/settings/billing/desktop.dart';
import 'package:medicamina_ui/dash/settings/billing/mobile.dart';

class MedicaminaDashSettingsBillingWidget extends StatelessWidget {
  const MedicaminaDashSettingsBillingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1000 > MediaQuery.of(context).size.width) {
      return const MedicaminaDashSettingsBillingMobileWidget();
    }
    return const MedicaminaDashSettingsBillingDesktopWidget();
  }
}
