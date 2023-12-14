import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/psychology/big5/widget.dart';
import 'package:medicamina_ui/dash/psychology/iq/widget.dart';
import 'package:medicamina_ui/dash/psychology/mcmi3/widget.dart';
import 'package:medicamina_ui/dash/psychology/mmpi2/widget.dart';
import 'package:medicamina_ui/dash/psychology/myer-briggs/widget.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashPsychologyMobileWidget extends StatelessWidget {
  const MedicaminaDashPsychologyMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              MedicaminaPsychologyMyerBriggsWidget(),
              MedicaminaPsychologyIQWidget(),
              MedicaminaPsychologyMMPI2Widget(),
              MedicaminaPsychologyMCMI3Widget(),
              MedicaminaPsychologyBig5Widget(),
            ],
          ),
        ),
      ),
    );
  }
}
