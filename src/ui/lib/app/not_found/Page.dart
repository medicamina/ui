import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicaminaNotFoundPage extends StatelessWidget {
  const MedicaminaNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('medicamina', style: GoogleFonts.balooTamma2()),
        centerTitle: true,
      ),
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
                      if (Modular.to.canPop()) {
                        return Modular.to.pop();
                      }
                      Modular.to.navigate('/');
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
