import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/AppBar.dart';

class MedicaminaDefaultLandingPage extends StatefulWidget {
  const MedicaminaDefaultLandingPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaDefaultLandingPage> createState() => _MedicaminaDefaultLandingPage();
}

class _MedicaminaDefaultLandingPage extends State<MedicaminaDefaultLandingPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Modular.get<MedicaminaAppBarWidget>(),
      body: SingleChildScrollView(
        controller: _controller,
        child: MediaQuery.of(context).size.width < 800 ? mobile(context, _controller) : desktop(context, _controller),
      ),
    );
  }
}

TextStyle? setHeadlineSize(context) {
  if (MediaQuery.of(context).size.width >= 750) {
    return Theme.of(context).textTheme.headline1;
  }
  if (MediaQuery.of(context).size.width >= 350) {
    return Theme.of(context).textTheme.headline2;
  }
  return Theme.of(context).textTheme.headline3;
}

Widget user(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: 350,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'PERSONAL',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for personal use')),
          ),
          ListTile(
            title: Center(
              child: Text('FREE', style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color), textAlign: TextAlign.center),
            ),
            subtitle: const Center(child: Text('Forever', textAlign: TextAlign.center)),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Build a family tree', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Import genetic data', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Discover diseases', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Share information with your consultant', textAlign: TextAlign.center)),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Beamer.of(context, root: true).beamToNamed('/register');
                },
                child: const Text('REGISTER'),
              ),
              const Padding(padding: EdgeInsets.all(5)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget doctor(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: 370,
    child: Card(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 6)),
          ListTile(
            title: Center(
              child: Text(
                'DOCTOR',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for consultancy')),
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          ListTile(
            title: Center(
              child: Text('\$1', style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color), textAlign: TextAlign.center),
            ),
            subtitle: const Center(
              child: Tooltip(child: Text('Per active client per month'), message: 'One visit per month', verticalOffset: 10, textAlign: TextAlign.center),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 24)),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Reduce misdiagnosis', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Avoid adverse drug reactions', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Send prescription insstructions to clients', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Discover drug allergies', textAlign: TextAlign.center)),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'UPGRADE',
                  style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 45), //////// HERE
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
        ],
      ),
    ),
  );
}

Widget geneticTest(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: 350,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text('GENOME TEST', style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5), textAlign: TextAlign.center),
            ),
            subtitle: const Center(child: Text('Order a genetic test', textAlign: TextAlign.center)),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$900',
                style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color),
              ),
            ),
            subtitle: const Center(child: Text('One time fee', textAlign: TextAlign.center)),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Order a genetic test by mail', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Receive automatically imported data', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Build your genetic data in a family tree', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(padding: EdgeInsets.only(left: 4, right: 4), child: Text('Share allergies with practitioners', textAlign: TextAlign.center)),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('ORDER')),
              const Padding(padding: EdgeInsets.all(5)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget mobile(BuildContext context, ScrollController controller) {
  return Column(
    children: [
      Container(
        color: Theme.of(context).dialogBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 44),
            Center(
              child: Text(
                'Medicine',
                style: setHeadlineSize(context),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'personalised to you.',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 44),
            Center(
              child: Transform.rotate(
                angle: 1 / 6 * 3.14,
                child: Icon(
                  CommunityMaterialIcons.dna,
                  size: (MediaQuery.of(context).size.height * 0.20),
                ),
              ),
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
      const SizedBox(height: 44),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      'Improve your diagnosis',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'using precision medicine and genomic testing.',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.stethoscope, size: MediaQuery.of(context).size.width * 0.2),
      const SizedBox(height: 22),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text("Enhance disease detection.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text("Use your genome to provide a more informed and tailored drug prescription.", textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 66),
      Icon(CommunityMaterialIcons.test_tube, size: MediaQuery.of(context).size.width * 0.2),
      const SizedBox(height: 22),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text("Discover genetic biomarkers.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text("Use research and technology to develop individual treatments.", textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      Column(
        children: [
          Text('Free', style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('to register and use.', style: Theme.of(context).textTheme.headline6),
          ),
        ],
      ),
      const SizedBox(height: 44),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          user(context, 0.9),
          const SizedBox(height: 6),
          doctor(context, 0.9),
          const SizedBox(height: 6),
          geneticTest(context, 0.9),
        ],
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('Analyse your family', style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('by creating a family tree.', style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.tree_outline, size: MediaQuery.of(context).size.width * 0.5),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text("Find the ancestry of diseases.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text("Create a family tree and discover the origin of genetic variations.", textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              'Use artificial intelligence',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text('to help you avoid drug reactions.', style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.robot_happy_outline, size: MediaQuery.of(context).size.width * 0.5),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text("Machine learning will help you.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text("Our open source software can guide you to make better informed choices.", textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text("Made for the love of our community.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text("Ut ostenderet mundi amorem, quem Christus ostendit.", textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Icon(CommunityMaterialIcons.church, size: MediaQuery.of(context).size.height * 0.1),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      TextButton(
        onPressed: () async {
          controller.animateTo(controller.position.minScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        child: const Text('Back to the top'),
      ),
      const SizedBox(height: 44),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Theme.of(context).dialogBackgroundColor,
        child: const Center(
          child: Text(
            'Copyright © 2022 Medicamina',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ],
  );
}

Widget desktop(BuildContext context, ScrollController controller) {
  return Column(
    children: [
      Container(
        color: Theme.of(context).dialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 122, bottom: 122),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Medicine',
                      style: setHeadlineSize(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 750 ? 8 : 2),
                    child: Center(
                      child: Text(
                        'personalised to you.',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Transform.rotate(
                  angle: 1 / 6 * 3.14,
                  child: Icon(
                    CommunityMaterialIcons.dna,
                    size: (MediaQuery.of(context).size.width * 0.30 - 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Improve your diagnosis', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('using precision medicine and genomic testing.', style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 44, right: 44),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(CommunityMaterialIcons.stethoscope, size: MediaQuery.of(context).size.width * 0.2),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(CommunityMaterialIcons.test_tube, size: MediaQuery.of(context).size.width * 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Enhance disease detection.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 6),
                    const Text("Use your genome to provide a more informed and tailored drug prescription.", textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Discover genetic biomarkers.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    const Text("Use research and technology to develop individual treatments.", textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Free', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('to register and use.', style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          user(context, 0.3),
          doctor(context, 0.3),
          geneticTest(context, 0.3),
        ],
      ),
      const SizedBox(height: 66),
      const Divider(indent: 22, endIndent: 22),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Analyse your family', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('by creating a family tree.', style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [Icon(CommunityMaterialIcons.tree_outline, size: MediaQuery.of(context).size.height * 0.5)],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Find the ancestry of diseases.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    const Text("Create a family tree and discover the origin of genetic variations.", textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(width: 44),
            ],
          ),
        ),
      ),
      const SizedBox(height: 66),
      const Divider(indent: 22, endIndent: 22),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Use artificial intelligence', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text('to help you avoid drug reactions.', style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [Icon(CommunityMaterialIcons.robot_happy_outline, size: MediaQuery.of(context).size.height * 0.4)],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Machine learning will help you.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    const Text("Our open source software can guide you to make better informed choices.", textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(width: 44),
            ],
          ),
        ),
      ),
      const SizedBox(height: 66),
      const Divider(indent: 22, endIndent: 22),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("Made for the love of our community.", style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    const Text("Ut ostenderet mundi amorem, quem Christus ostendit.", textAlign: TextAlign.center),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [Icon(CommunityMaterialIcons.church, size: MediaQuery.of(context).size.height * 0.1)],
                ),
              ),
              const SizedBox(width: 22),
            ],
          ),
        ),
      ),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      TextButton(
        onPressed: () async {
          controller.animateTo(controller.position.minScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        },
        child: const Text('Back to the top'),
      ),
      const SizedBox(height: 44),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Theme.of(context).dialogBackgroundColor,
        child: const Center(
          child: Text(
            'Copyright © 2022 Medicamina',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ],
  );
}
