import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicaminaNotFound extends StatelessWidget {
  const MedicaminaNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Check if logged in
            Beamer.of(context).beamBack();
          },
        ),
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
                  Text('ERROR', style: Theme.of(context).textTheme.headline3?.apply(heightDelta: 0, heightFactor: 0)),
                  Text('404', style: Theme.of(context).textTheme.headline1?.apply(heightDelta: 0, heightFactor: 0)),
                  Text('Page not found', style: Theme.of(context).textTheme.subtitle1?.apply(heightDelta: 0, heightFactor: 0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
