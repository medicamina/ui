import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class MedicaminaDefaultPage extends StatefulWidget {
  const MedicaminaDefaultPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MedicaminaDefaultPage> createState() => _MedicaminaDefaultPageState();
}

class _MedicaminaDefaultPageState extends State<MedicaminaDefaultPage> {
  TextStyle? setHeadlineSize(context) {
    if (MediaQuery.of(context).size.width >= 700) {
      return Theme.of(context).textTheme.headline1?.apply(fontStyle: FontStyle.italic, color: Colors.black);
    }
    if (MediaQuery.of(context).size.width >= 350) {
      return Theme.of(context).textTheme.headline2?.apply(fontStyle: FontStyle.italic, color: Colors.black);
    }
    return Theme.of(context).textTheme.headline3?.apply(fontStyle: FontStyle.italic, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () => Beamer.of(context).beamToNamed('/pricing'),
            label: const Text("Pricing"),
            icon: const Icon(Icons.attach_money),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          ElevatedButton.icon(
            onPressed: () => Beamer.of(context).beamToNamed('/login'),
            label: const Text("Login"),
            icon: const Icon(Icons.login),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 25),
                child: Text(
                  'MEDICAMINA',
                  style: setHeadlineSize(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: Icon(
                              CommunityMaterialIcons.dna,
                              size: (MediaQuery.of(context).size.width * 0.125),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4, // 60%
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: SelectableText(
                              'Precision medicine is a tailored approach to disease prevention and treatment that takes into account differences in people\'s genes, environments, and lifestyles.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // 60%
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: SelectableText(
                              'Precision medicine is underpinned by genetic and genomic testing (sequencing), the results of which enable better prediction, prevention and treatment of disease as well as more accurate medication diagnosis.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: Icon(
                              CommunityMaterialIcons.pill,
                              size: (MediaQuery.of(context).size.width * 0.125),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: Icon(
                              CommunityMaterialIcons.hospital_building,
                              size: (MediaQuery.of(context).size.width * 0.125),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4, // 60%
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: SelectableText(
                              'Share accurate information of your families health history with your physician, surgeon or consultant and keep your data with you.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(minimumSize: const Size(100, 50)),
                            child: const Text(
                              'CREATE AN ACCOUNT',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {
                              Beamer.of(context).beamToNamed('/register');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 4, // 60%
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: SelectableText(
                              'Ut ostenderet mundi amorem, quem ostendit nobis.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 5),
                            child: Icon(
                              CommunityMaterialIcons.church,
                              size: (MediaQuery.of(context).size.width * 0.125),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
