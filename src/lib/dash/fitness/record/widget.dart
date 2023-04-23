import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                'Record',
                style: TextStyle(
                  fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [IconButton(onPressed: () {}, icon: Icon(CommunityMaterialIcons.clipboard_clock_outline))],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            height: 86,
            child: ListView(
              primary: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox.fromSize(
                    size: const Size(86, 86),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox.fromSize(
                    size: const Size(86, 86),
                    child: ClipOval(
                      child: Material(
                        color: Theme.of(context).hoverColor.withAlpha(15),
                        child: InkWell(
                          radius: 84,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.liquor),
                              SizedBox(height: 2),
                              Text('Alcohol', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
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
                    size: const Size(86, 86),
                    child: ClipOval(
                      child: Material(
                        color: Theme.of(context).hoverColor.withAlpha(15),
                        child: InkWell(
                          radius: 84,
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.local_dining),
                              SizedBox(height: 2),
                              Text('Meal', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
