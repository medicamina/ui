import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class MedicaminaNotFoundPage extends StatelessWidget {
  const MedicaminaNotFoundPage({Key? key, required this.beamerKey}) : super(key: key);
  final GlobalKey<BeamerState> beamerKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  Text(
                    'ERROR',
                    style: Theme.of(context).textTheme.headline3?.apply(heightDelta: 0, heightFactor: 0, color: Theme.of(context).textTheme.bodySmall?.color),
                  ),
                  Text(
                    '404',
                    style: Theme.of(context).textTheme.headline1?.apply(heightDelta: 0, heightFactor: 0),
                  ),
                  Text(
                    'Page not found',
                    style: Theme.of(context).textTheme.subtitle1?.apply(heightDelta: 0, heightFactor: 0),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (Beamer.of(context).canBeamBack) {
                        Beamer.of(beamerKey.currentContext as BuildContext).beamBack();
                      } else {
                        Beamer.of(beamerKey.currentContext as BuildContext).beamToNamed('/');
                      }
                    },
                    child: const Text('Back'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
