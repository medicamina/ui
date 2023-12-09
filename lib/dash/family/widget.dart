import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicaminaDashFamilyWidget extends StatelessWidget {
  MedicaminaDashFamilyWidget({Key? key}) : super(key: key);

  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.1,
        constrained: false,
        maxScale: 1.5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.25,
          // color: Colors.amberAccent,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.man,
                                  size: 60.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Text('Spencer Walklate'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('images/tree.svg', semanticsLabel: 'Tree'),
                  Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.woman,
                                  size: 60.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Text('Amanda Lennon'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.person,
                                  size: 60.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: Text('Jake Walklate'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
