import 'package:flutter/material.dart';

class MedicaminaDashFamilyWidget extends StatelessWidget {
  MedicaminaDashFamilyWidget({Key? key}) : super(key: key);
  
  final TransformationController _transformationController = TransformationController();

  @override
  Widget build(BuildContext context) {
    return
        Center(
      child: InteractiveViewer(
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.1,
        constrained: false,
        maxScale: 1.5,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.25,
            color: Colors.amberAccent),
      ),
    );
  }
}
