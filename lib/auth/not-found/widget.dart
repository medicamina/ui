import 'package:flutter/material.dart';

class MedicaminaAuthNotFoundWidget extends StatelessWidget {
  const MedicaminaAuthNotFoundWidget({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.headlineMedium?.apply(heightDelta: 0, heightFactor: 0, color: Theme.of(context).textTheme.bodySmall?.color),
                ),
                Text(
                  '404',
                  style: Theme.of(context).textTheme.headlineLarge?.apply(heightDelta: 0, heightFactor: 0),
                ),
                Text(
                  'Page not found',
                  style: Theme.of(context).textTheme.titleSmall?.apply(heightDelta: 0, heightFactor: 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
