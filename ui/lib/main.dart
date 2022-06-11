import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:flutter/foundation.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'medicamina',
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'medicamina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextStyle? set_image_size(context) {
  // debugPrint(MediaQuery.of(context).size.width.toString());
  if (MediaQuery.of(context).size.width  >= 700) {
    return Theme.of(context).textTheme.headline1?.apply(
      color: Colors.black,
    );
  }  
  if (MediaQuery.of(context).size.width >= 350) {
    return Theme.of(context).textTheme.headline2?.apply(
      color: Colors.black,
    );
  }
  return Theme.of(context).textTheme.headline3?.apply(
      color: Colors.black,
    );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Text(
                    'MEDICAMINA',
                    // style: Theme.of(context).textTheme.headline1,
                    style: set_image_size(context),
                    textAlign: TextAlign.center,
                  ),
                )
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
                              )
                            ),
                          )
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
                            )
                          )
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
                            )
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: Icon(
                                CommunityMaterialIcons.pill,
                                size: (MediaQuery.of(context).size.width * 0.125),
                              )
                            ),
                          )
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
                              )
                            ),
                          )
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
                            )
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: ElevatedButton(
                                child: const Text(
                                  'SIGN UP TODAY',
                                  ),
                                onPressed: () { 
                                    return;
                                  },
                              )
                          )
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
                            )
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child:  Icon(
                                CommunityMaterialIcons.church,
                                size: (MediaQuery.of(context).size.width * 0.125),
                              )
                            ),
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              ),
            ],
          )
        )
      )
    );
  }
}
