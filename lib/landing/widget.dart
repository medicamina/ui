import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const String improve = 'Improve your diagnosis';
const String improveUsing = 'using precision medicine and genomic testing';

const String diseaseDetection = 'Enhance disease detecton';
const String diseaseDetectionHow =
    'Use your genome to provide a more informed and tailored drug prescription.';

const String biomarkers = 'Discover genetic biomarkers';
const String biomarkerHow =
    'Use research and technology to develop individual treatments';

const String familyTree = 'Analyse your family';
const String familyTreeHow = 'by creating a family tree.';
const String familyTreeText = 'Find the ancestry of diseases.';
const String familyTreeSubtext =
    'Create a family tree and discover the origin of genetic variations.';

const String machineLearning = 'Use artificial intelligence';
const String machienLearningWhy = 'to help you avoid drug reactions.';
const String machineLearningText = 'Machine learning will help you.';
const String machineLearningSubtext =
    'Our open source software can guide you to make better informed diagnostic choices.';

class MedicaminaLandingPage extends StatefulWidget {
  const MedicaminaLandingPage({Key? key}) : super(key: key);

  @override
  State<MedicaminaLandingPage> createState() => _MedicaminaLandingPage();
}

class _MedicaminaLandingPage extends State<MedicaminaLandingPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight - 6),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text('medicamina'),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Center(child: Text('Navigate')),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.home),
                            title: const Text('Home'),
                            enabled: Modular.args.uri.toString() != '/',
                            onTap: () {
                              Navigator.pop(context);
                              Modular.to.navigate('/');
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.description),
                            title: const Text('Documentation'),
                            onTap: () {
                              launchUrl(
                                Uri(
                                  scheme: 'https',
                                  host: 'docs.medicamina.us',
                                ),
                                mode: kIsWeb
                                    ? LaunchMode.externalApplication
                                    : LaunchMode.inAppWebView,
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.login_outlined),
                            title: const Text('Login'),
                            enabled:
                                Modular.args.uri.toString() != '/auth/login',
                            onTap: () {
                              Navigator.pop(context);
                              Modular.to.navigate('/auth/login');
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.person_add_outlined),
                            title: const Text('Register'),
                            enabled:
                                Modular.args.uri.toString() != '/auth/register',
                            onTap: () {
                              Navigator.pop(context);
                              Modular.to.navigate('/auth/register');
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.lock_open),
                            title: const Text('Reset password'),
                            enabled:
                                Modular.args.uri.toString() != '/auth/password',
                            onTap: () {
                              Navigator.pop(context);
                              Modular.to.navigate('/auth/password');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: MediaQuery.of(context).size.width < 800
            ? mobile(context, _controller)
            : desktop(context, _controller),
      ),
    );
  }
}

TextStyle? setHeadlineSize(context) {
  if (MediaQuery.of(context).size.width >= 750) {
    return Theme.of(context).textTheme.displayLarge;
  }
  if (MediaQuery.of(context).size.width >= 350) {
    return Theme.of(context).textTheme.displayMedium;
  }
  return Theme.of(context).textTheme.displaySmall;
}

Widget user(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: 334,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'PERSONAL',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for personal use')),
          ),
          ListTile(
            title: Center(
              child: Text('FREE',
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                        fontWeightDelta: 5,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                  textAlign: TextAlign.center),
            ),
            subtitle: const Center(
                child: Text('Forever', textAlign: TextAlign.center)),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Build a family tree', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Import genetic data', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Discover diseases', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Share information with your consultant',
                  textAlign: TextAlign.center)),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/auth/register');
                },
                child: const Text('REGISTER'),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}

Widget doctor(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: kIsWeb ? 360 : 380,
    child: Card(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 6)),
          ListTile(
            title: Center(
              child: Text(
                'DOCTOR',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for consultancy')),
          ),
          const Padding(padding: EdgeInsets.only(top: 4)),
          ListTile(
            title: Center(
              child: Text('\$1',
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                        fontWeightDelta: 5,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                  textAlign: TextAlign.center),
            ),
            subtitle: const Center(
              child: Tooltip(
                child: Text('Per active client per month'),
                message: 'One visit per month',
                verticalOffset: 10,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 24)),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Reduce misdiagnosis', textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Avoid adverse drug reactions',
                  textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text('Send prescription insstructions to clients',
                  textAlign: TextAlign.center)),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child:
                  Text('Discover drug allergies', textAlign: TextAlign.center)),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/auth/upgrade');
                },
                child: Text(
                  'UPGRADE',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.4,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 45),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}

Widget geneticTest(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    height: 334,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'GENOME TEST',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontWeightDelta: 5),
                textAlign: TextAlign.center,
              ),
            ),
            subtitle: const Center(
                child:
                    Text('Order a genetic test', textAlign: TextAlign.center)),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$200',
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                      fontWeightDelta: 5,
                      color: Theme.of(context).textTheme.headlineSmall?.color,
                    ),
              ),
            ),
            subtitle: const Center(
                child: Text('One time fee', textAlign: TextAlign.center)),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Text(
              'Order a genetic test by mail',
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Text(
              'Receive automatically imported data',
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Text(
              'Build your genetic data in a family tree',
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(indent: 15, endIndent: 15),
          const Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Text(
              'Share allergies with practitioners',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/dash/settings/order');
                },
                child: const Text('ORDER'),
              ),
            ],
          ),
          const Spacer(),
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
                style: Theme.of(context).textTheme.titleMedium,
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
                      improve,
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  improveUsing,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.stethoscope,
          size: MediaQuery.of(context).size.width * 0.2),
      const SizedBox(height: 22),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              diseaseDetection,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              diseaseDetectionHow,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 66),
      Icon(CommunityMaterialIcons.test_tube,
          size: MediaQuery.of(context).size.width * 0.2),
      const SizedBox(height: 22),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              biomarkers,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(biomarkerHow, textAlign: TextAlign.center),
          ),
        ],
      ),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      Column(
        children: [
          Text('Free', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'to register and use.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
            child: Text(
              familyTree,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              familyTreeHow,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.tree_outline,
          size: MediaQuery.of(context).size.width * 0.5),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(familyTreeText,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              familyTreeSubtext,
              textAlign: TextAlign.center,
            ),
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
              machineLearning,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              machienLearningWhy,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 44),
      Icon(CommunityMaterialIcons.robot_happy_outline,
          size: MediaQuery.of(context).size.width * 0.5),
      const SizedBox(height: 44),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              machineLearningText,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(machineLearningSubtext, textAlign: TextAlign.center),
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
              "Made for the love of our community.",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "Ut ostenderet mundi amorem, quem Christus ostendit.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Icon(CommunityMaterialIcons.church,
          size: MediaQuery.of(context).size.height * 0.1),
      const SizedBox(height: 44),
      const Divider(indent: 22, endIndent: 22),
      const SizedBox(height: 44),
      TextButton(
        onPressed: () async {
          controller.animateTo(
            controller.position.minScrollExtent,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
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
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width > 750 ? 8 : 2,
                    ),
                    child: Center(
                      child: Text(
                        'personalised to you.',
                        style: Theme.of(context).textTheme.headlineSmall,
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
                    Text(
                      improve,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        improveUsing,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                    Icon(
                      CommunityMaterialIcons.stethoscope,
                      size: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(
                      CommunityMaterialIcons.test_tube,
                      size: MediaQuery.of(context).size.width * 0.2,
                    ),
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
                    Text(
                      diseaseDetection,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      diseaseDetectionHow,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      biomarkers,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(biomarkerHow, textAlign: TextAlign.center),
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
          padding:
              const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'to register and use.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
          padding:
              const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      familyTree,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        familyTreeHow,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                  children: [
                    Icon(
                      CommunityMaterialIcons.tree_outline,
                      size: MediaQuery.of(context).size.height * 0.5,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      familyTreeText,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(familyTreeSubtext, textAlign: TextAlign.center),
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
          padding:
              const EdgeInsets.only(left: 44, right: 44, top: 44, bottom: 44),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      machineLearning,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        machienLearningWhy,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                  children: [
                    Icon(CommunityMaterialIcons.robot_happy_outline,
                        size: MediaQuery.of(context).size.height * 0.4)
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(machineLearningText,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    const Text(machineLearningSubtext,
                        textAlign: TextAlign.center),
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
                    Text(
                      "Made for the love of our community.",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Ut ostenderet mundi amorem, quem Christus ostendit.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(CommunityMaterialIcons.church,
                        size: MediaQuery.of(context).size.height * 0.1)
                  ],
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
          controller.animateTo(controller.position.minScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
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
