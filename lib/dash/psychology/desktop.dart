import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina_ui/dash/psychology/big5/widget.dart';
import 'package:medicamina_ui/dash/psychology/iq/widget.dart';
import 'package:medicamina_ui/dash/psychology/mcmi3/widget.dart';
import 'package:medicamina_ui/dash/psychology/mmpi2/widget.dart';
import 'package:medicamina_ui/dash/psychology/myer-briggs/widget.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashPsychologyDesktopWidget extends StatelessWidget {
  const MedicaminaDashPsychologyDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1, child: MedicaminaPsychologyMyerBriggsWidget()),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MedicaminaPsychologyIQWidget(),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child:
                                            MedicaminaPsychologyMMPI2Widget(),
                                      ),
                                      Expanded(
                                        child:
                                            MedicaminaPsychologyMCMI3Widget(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: MedicaminaPsychologyBig5Widget()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
