import 'package:flutter/material.dart';

class MedicaminsaDashHistoryPage extends StatefulWidget {
  const MedicaminsaDashHistoryPage({Key? key}) : super(key: key);

  @override
  State<MedicaminsaDashHistoryPage> createState() => _MedicaminsaDashHistoryPageState();
}

class _MedicaminsaDashHistoryPageState extends State<MedicaminsaDashHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        elevation: 0,
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Text('History'),
        ),
      ),
    );
  }
}
