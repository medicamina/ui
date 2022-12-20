import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MedicaminaPricingPage extends StatelessWidget {
  const MedicaminaPricingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 900 > MediaQuery.of(context).size.width ? mobile(context) : desktop(context);
  }
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
              child: Text(
                'FREE',
                style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color),
              ),
            ),
            subtitle: const Center(child: Text('Forever')),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('Build a family tree'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Import genetic data'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Discover diseases'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Share information with your consultant'),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Beamer.of(context).beamToNamed('/register');
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
    height: 350,
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                'DOCTOR',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for consultancy')),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$1',
                style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color),
              ),
            ),
            subtitle: const Center(
              child: Tooltip(
                child: Text('Per active client per month'),
                message: 'One visit per month',
                verticalOffset: 10,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('Reduce misdiagnosis'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Avoid adverse drug reactions'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Send prescription insstructions to clients'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Discover drug allergies'),
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
          )
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
              child: Text(
                'GENOME TEST',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('Order a genetic test')),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$900',
                style: Theme.of(context).textTheme.headline4?.apply(fontWeightDelta: 5, color: Theme.of(context).textTheme.headline5?.color),
              ),
            ),
            subtitle: const Center(child: Text('One time fee')),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('Order a genetic test by mail'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Receive automatically imported data'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Build your genetic data in a family tree'),
          const Divider(indent: 15, endIndent: 15),
          const Text('Share allergies with practitioners'),
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

Widget mobile(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              // const SizedBox(height: 12),
              user(context, 0.8),
              doctor(context, 0.8),
              geneticTest(context, 0.8),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget desktop(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user(context, 0.3),
              doctor(context, 0.3),
              geneticTest(context, 0.3),
            ],
          ),
        ),
      ),
    ),
  );
}
