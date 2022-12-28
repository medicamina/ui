import 'package:flutter/material.dart';

class MedicaminsaDashHistoryPage extends StatefulWidget {
  const MedicaminsaDashHistoryPage({Key? key}) : super(key: key);

  @override
  State<MedicaminsaDashHistoryPage> createState() => _MedicaminsaDashHistoryPageState();
}

class _MedicaminsaDashHistoryPageState extends State<MedicaminsaDashHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6),
      child: Card(
        child: Text('History'),
      ),
    );
  }
}
