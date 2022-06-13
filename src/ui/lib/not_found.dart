import 'package:flutter/material.dart';

class MedicaminaNotFound extends StatelessWidget {
  const MedicaminaNotFound({ Key? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Not Found'),
      //   ),
      body:  Text("404 not found")
    );
  }
}