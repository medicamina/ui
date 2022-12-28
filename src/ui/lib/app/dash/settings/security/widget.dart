import 'package:flutter/material.dart';

class MedicaminaDashSettingsSecurityWidget extends StatefulWidget {
  const MedicaminaDashSettingsSecurityWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashSettingsSecurityWidget> createState() => _MedicaminaDashSettingsSecurityWidget();
}

class _MedicaminaDashSettingsSecurityWidget extends State<MedicaminaDashSettingsSecurityWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Security', style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 4),
          const Divider(height: 1),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}