import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MedicaminaPricingPage extends StatelessWidget {
  const MedicaminaPricingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('medicamina'),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () => {},
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
      body: 900 > MediaQuery.of(context).size.width ? mobile(context) : desktop(context),
    );
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
                'Personal',
                style: Theme.of(context).textTheme.headline5?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for personal use')),
          ),
          ListTile(
            title: Center(
              child: Text(
                'FREE',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('Forever')),
          ),
          Center(
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Build a family tree'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Import genetic data'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Discover diseases'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Share information with your consultant'),
                    const Text(''),
                  ],
                ),
              ],
            ),
          ),
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
                'Doctor',
                style: Theme.of(context).textTheme.headline5?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('An account for consultancy')),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$1',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('per active client per month')),
          ),
          Center(
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Avoid misdiagnosis'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Discover drug allergies'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Avoid adverse drug reactions'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Send prescription information to clients'),
                    const Text(''),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text('UPGRADE'),
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
                'Genetic test',
                style: Theme.of(context).textTheme.headline5?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('Order a genetic test')),
          ),
          ListTile(
            title: Center(
              child: Text(
                '\$900',
                style: Theme.of(context).textTheme.headline6?.apply(fontWeightDelta: 5),
              ),
            ),
            subtitle: const Center(child: Text('One time fee')),
          ),
          Center(
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('We will take care of the data importing'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Receive a swab test in the mail'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Store genetic data in the family tree'),
                    const Text(''),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('\u2022', style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const Text('Discover inherited diseases'),
                    const Text(''),
                  ],
                ),
              ],
            ),
          ),
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
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            user(context, 0.8),
            doctor(context, 0.8),
            geneticTest(context, 0.8),
          ],
        ),
      ),
    ),
  );
}

Widget desktop(BuildContext context) {
  return SingleChildScrollView(
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
  );
}
