import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicaminaDashNotFoundWidget extends StatelessWidget {
  const MedicaminaDashNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                Text(
                  'ERROR',
                  style: Theme.of(context).textTheme.displaySmall?.apply(
                      heightDelta: 0,
                      heightFactor: 0,
                      color: Theme.of(context).textTheme.bodySmall?.color),
                ),
                Text(
                  '404',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.apply(heightDelta: 0, heightFactor: 0),
                ),
                Text(
                  'Page not found',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(heightDelta: 0, heightFactor: 0),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Modular.to.navigate('/dash/home');
                  },
                  child: const Text('Dashboard home'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
