import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class MedicaminaDashFamilyWidget extends StatefulWidget {
  @override
  _MedicaminaDashFamilyWidget createState() => _MedicaminaDashFamilyWidget();
}

class _MedicaminaDashFamilyWidget extends State<MedicaminaDashFamilyWidget> {
  // _MedicaminaDashFamilyWidget({Key? key}) : super(key: key);

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    // final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    // final node10 = Node.Id(10);
    final node11 = Node.Id(11);
    final node12 = Node.Id(12);

    graph.addEdge(node1, node2);
    // graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4);
    graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    graph.addEdge(node6, node7);
    graph.addEdge(node6, node8);
    graph.addEdge(node4, node9);
    // graph.addEdge(node4, node10);
    graph.addEdge(node4, node11);
    graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (80)
      ..levelSeparation = (100)
      ..subtreeSeparation = (100)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 1,
        maxScale: 2,
        // boundaryMargin: EdgeInsets.all(double.infinity),
        child: OverflowBox(
          alignment: Alignment.center,
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
          child: Container(
            child: GraphView(
              algorithm: BuchheimWalkerAlgorithm(
                builder,
                TreeEdgeRenderer(builder),
              ),
              graph: graph,
              paint: Paint()
                ..color = Theme.of(context).textTheme.bodyLarge!.color!
                ..strokeWidth = 1
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                // I can decide what widget should be shown here based on the id
                var a = node.key?.value as int;
                return rectangleWidget(a);
              },
            ),
          ),
        ),
      ),
    );

    // child: InteractiveViewer(
    //   transformationController: _transformationController,
    //   boundaryMargin: const EdgeInsets.all(100),
    //   minScale: 0.1,
    //   constrained: false,
    //   maxScale: 1.5,
    //   child:
    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height * 1.25,

    // child:
    //     GraphView(
    //   graph: graph,
    //   algorithm:
    //       BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
    //   paint: Paint()
    //     ..color = Colors.green
    //     ..strokeWidth = 1
    //     ..style = PaintingStyle.stroke,

    // ),
    // ),
    // ),
    // );
  }
}

Widget rectangleWidget(int a) {
  String getName(int b) {
    if (a == 1) {
      return 'Jake Walklate';
    }
    if (a == 2) {
      return 'Spencer Walklate';
    }
    if (a == 4) {
      return 'Amanda Lennon';
    }
    if (a == 5) {
      return 'Spencer Walklate';
    }
    if (a == 6) {
      return 'Janice White';
    }
    if (a == 7) {
      return 'Thyra Burdon';
    }
    if (a == 8) {
      return 'Stephen White';
    }
    if (a == 9) {
      return 'Greg Lennon';
    }
    if (a == 11) {
      return 'Linda Jury';
    }
    if (a == 12) {
      return 'Beatrice Caldwell';
    }
    return '';
  }

  return InkWell(
    onTap: () {
      print('clicked');
    },
    child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: const Color.fromRGBO(187, 222, 251, 1), spreadRadius: 1),
          ],
        ),
        child: Text(getName(a))),
  );
}
