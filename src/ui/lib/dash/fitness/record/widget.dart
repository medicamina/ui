import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/states.dart';

class MedicaminaDashFitnessRecordWidget extends StatefulWidget {
  const MedicaminaDashFitnessRecordWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashFitnessRecordWidget> createState() => _MedicaminaDashFitnessRecordWidgetState();
}

class _MedicaminaDashFitnessRecordWidgetState extends State<MedicaminaDashFitnessRecordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Information input',
            style: TextStyle(
              fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: PageView(
            padEnds: false,
            physics: const ClampingScrollPhysics(),
            controller: PageController(viewportFraction: 106 / MediaQuery.of(context).size.width),
            children: [
              MediaQuery.of(context).size.width >= 630 ? Spacer() : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.stethoscope),
                            SizedBox(height: 2),
                            Text('Heart rate', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.scale),
                            SizedBox(height: 2),
                            Text('Weight', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.av_timer),
                            SizedBox(height: 2),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text('Blood pressure', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.human_male_height),
                            SizedBox(height: 2),
                            Text('Height', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.weight_lifter),
                            SizedBox(height: 2),
                            Text('Exercise', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox.fromSize(
                  size: const Size(84, 84),
                  child: ClipOval(
                    child: Material(
                      color: Theme.of(context).hoverColor.withAlpha(15),
                      child: InkWell(
                        radius: 84,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CommunityMaterialIcons.sleep),
                            SizedBox(height: 2),
                            Text('Sleep', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              MediaQuery.of(context).size.width >= 630 ? Spacer() : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

// class MedicaminaDashFitnessRecordWidget extends StatefulWidget {
//   const MedicaminaDashFitnessRecordWidget({Key? key}) : super(key: key);

//   @override
//   State<MedicaminaDashFitnessRecordWidget> createState() => _MedicaminaDashFitnessRecordWidgetState();
// }

// class _MedicaminaDashFitnessRecordWidgetState extends State<MedicaminaDashFitnessRecordWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ListTile(
//           title: Text(
//             'Record body',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
//             ),
//           ),
//         ),

//         const SizedBox(height: 12),

//         const SizedBox(height: 12),

//         const SizedBox(height: 12),



//         const SizedBox(height: 12),


//         const SizedBox(height: 12),



//         ),
//       ],
//     );
//   }
// }
