
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicamina/dash/edicts/desktop.dart';

class MedicaminaDashEdictsWidget extends StatelessWidget {
  const MedicaminaDashEdictsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (1000 > MediaQuery.of(context).size.width) {
      return CircularProgressIndicator();
    }
    return const MedicaminaDashEdictsDesktopWidget();
  }
}
