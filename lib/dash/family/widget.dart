import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphview/GraphView.dart';
import 'package:medicamina_ui/states.dart';

class MedicaminaDashFamilyWidget extends StatefulWidget {
  const MedicaminaDashFamilyWidget({super.key});

  @override
  _MedicaminaDashFamilyWidget createState() => _MedicaminaDashFamilyWidget();
}

class _MedicaminaDashFamilyWidget extends State<MedicaminaDashFamilyWidget> with SingleTickerProviderStateMixin {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  late Map<String, dynamic> json;
  late TransformationController _transformationController;
  late AnimationController _animationController;
  late Animation<Matrix4> _animation;
  double _totalWidth = 0.0;
  double _totalHeight = 0.0;
  GlobalKey _graphKey = GlobalKey();

  void _calculateTotalWidth() {
    RenderBox? graphBox = _graphKey.currentContext?.findRenderObject() as RenderBox?;

    if (graphBox != null) {
      setState(() {
        _totalWidth = graphBox.size.width;
        _totalHeight = graphBox.size.height;
      });
    } else {
      print('Failed to calculate total width');
    }
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Map<String, dynamic>? findNodeById(List<Map<String, dynamic>> nodes, int id) {
    for (var node in nodes) {
      if (node['id'] == id) {
        return node;
      }
      // Check father
      if (node.containsKey('father') && node['father'] != null) {
        var foundNode = findNodeById([node['father']], id);
        if (foundNode != null) {
          return foundNode;
        }
      }
      // Check mother
      if (node.containsKey('mother') && node['mother'] != null) {
        var foundNode = findNodeById([node['mother']], id);
        if (foundNode != null) {
          return foundNode;
        }
      }
    }
    return null;
  }

  void addEdgesFromNode(Map<String, dynamic>? node, Graph graph) {
    if (node == null) return;

    final int nodeId = node['id'];

    void addParentEdge(String parentType) {
      if (node.containsKey(parentType) && node[parentType] != null) {
        final int parentId = node[parentType]['id'];
        graph.addEdge(Node.Id(nodeId), Node.Id(parentId));

        // Recursively add edges for the parent node
        addEdgesFromNode(node[parentType], graph);
      }
    }

    // Add edges for both father and mother
    addParentEdge('father');
    addParentEdge('mother');
  }

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    json = {
      'nodes': [
        {
          'id': 1,
          'label': 'Jake Walklate',
          'gender': 'person',
          'father': {
            'id': 2,
            'label': 'Spencer Walklate',
            'gender': 'male',
            'father': {
              'id': 4,
              'label': 'Spencer Walklate',
              'gender': 'male',
              'father': {
                'id': 8,
                'label': 'Spencer Henry Walklate',
                'gender': 'male',
                'father': {'id': 16, 'label': 'Spencer Walklate', 'gender': 'male'},
                'mother': {'id': 17, 'label': 'May Hope Ashton', 'gender': 'female'}
              },
              'mother': {
                'id': 9,
                'label': 'Linda Maude O\'Keeffe',
                'gender': 'female',
                'father': {'id': 18, 'label': 'Thomas O\'Keeffe', 'gender': 'male'},
                'mother': {'id': 19, 'label': 'Annabella M Olive', 'gender': 'female'}
              }
            },
            'mother': {
              'id': 5,
              'label': 'Janice White',
              'gender': 'female',
              'father': {
                'id': 10,
                'label': 'Stephen White',
                'gender': 'male',
                'father': {'id': 20, 'label': 'Aaron William White', 'gender': 'male'},
                'mother': {'id': 21, 'label': 'Florence Eliza Thallin', 'gender': 'female'},
              },
              'mother': {
                'id': 11,
                'label': 'Thyra Lyell Burdon',
                'gender': 'female',
                'father': {'id': 22, 'label': 'Walter Ronald Burdon', 'gender': 'male'},
                'mother': {'id': 23, 'label': 'Ida Isabel Smith', 'gender': 'female'},
              },
            },
          },
          'mother': {
            'id': 3,
            'label': 'Amanda Lennon',
            'gender': 'female',
            'mother': {
              'id': 6,
              'label': 'Linda Jury',
              'gender': 'female',
              'mother': {
                'id': 15,
                'label': 'Beatrice Caldwell',
                'gender': 'female',
                'father': {'id': 30, 'label': 'Alexander Francis Caldwell', 'gender': 'male'},
                'mother': {'id': 31, 'label': 'Ada Eccelston', 'gender': 'female'},
              },
              'father': {
                'id': 14,
                'label': 'Jonathan Jury',
                'gender': 'male',
                'father': {'id': 28, 'label': 'Alfred John Jury', 'gender': 'male'},
                'mother': {'id': 29, 'label': 'Miriam Price', 'gender': 'female'},
              },
            },
            'father': {
              'id': 7,
              'label': 'Greg Lennon',
              'gender': 'male',
              'father': {
                'id': 12,
                'label': 'William Lennon',
                'gender': 'male',
                'father': {'id': 24, 'label': 'William Norman Lennon', 'gender': 'male'},
                'mother': {'id': 25, 'label': 'Kathleen May Middleton', 'gender': 'female'},
              },
              'mother': {
                'id': 13,
                'label': 'Fay Blake',
                'gender': 'female',
                'father': {'id': 26, 'label': 'Aubrey James Blake', 'gender': 'male'},
                'mother': {'id': 27, 'label': 'Lorna Jane Cook', 'gender': 'female'},
              },
            },
          }
        },
      ],
    };

    json['nodes']?.forEach((element) {
      addEdgesFromNode(element, graph);
    });

    builder
      ..siblingSeparation = (80)
      ..levelSeparation = (100)
      ..subtreeSeparation = (100)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP);
  }

  void _animateTransformation(Matrix4 begin, Matrix4 end) {
    _animation = Matrix4Tween(begin: begin, end: end).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    )..addListener(() {
        _transformationController.value = _animation.value;
      });

    _animationController.forward(from: 0);
  }

  void _resetTransformation() {
    _calculateTotalWidth();

    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    _animateTransformation(
      _transformationController.value,
      Matrix4.identity()..translate(-_totalWidth / 1.5, -_totalHeight / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          key: _graphKey,
          transformationController: _transformationController,
          constrained: false,
          boundaryMargin: EdgeInsets.all(100),
          minScale: 0.01,
          maxScale: 5.6,
          child: Container(
            padding: EdgeInsets.all(50),
            child: GraphView(
              graph: graph,
              algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
              paint: Paint()
                ..color = Colors.black
                ..strokeWidth = 1.0
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                var a = node.key?.value as int;
                var nodes = json['nodes'];
                var nodeValue = findNodeById(nodes, a);
                return RectangleWidget(nodeValue, graph);
              },
            ),
          ),
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final matrix = _transformationController.value;
                final translation = matrix.getTranslation();
                final focalPoint = Offset(translation.x, translation.y);

                _transformationController.value = Matrix4.identity()
                  ..translate(focalPoint.dx, focalPoint.dy)
                  ..scale(1.5);
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                final matrix = _transformationController.value;
                final translation = matrix.getTranslation();
                final focalPoint = Offset(translation.x, translation.y);

                _transformationController.value = Matrix4.identity()
                  ..translate(translation.x, translation.y)
                  ..scale(1.0000001);
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: _resetTransformation,
            ),
          ],
        ),
      ],
    );
  }
}

class RectangleWidget extends StatefulWidget {
  final Map<String, dynamic>? nodeValue;
  final Graph graph;

  RectangleWidget(this.nodeValue, this.graph, {Key? key}) : super(key: key);

  @override
  State<RectangleWidget> createState() => _RectangleWidgetState();
}

class _RectangleWidgetState extends State<RectangleWidget> {
  late String label;
  late String gender;
  bool activated = true;

  @override
  void initState() {
    super.initState();
    label = widget.nodeValue?['label'] ?? 'Unknown';
    gender = widget.nodeValue?['gender'] ?? 'person';
  }

  IconData getIcon(String? gender) {
    if (gender == 'male') {
      return Icons.man;
    }
    if (gender == 'female') {
      return Icons.woman;
    }
    return Icons.person;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: (() => {}), child: Icon(Icons.edit), style: ElevatedButton.styleFrom(elevation: 0)),
                    Spacer(),
                    ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          activated = !activated;
                        });
                        if (!activated) {
                          widget.graph.removeNode(Node.Id(widget.nodeValue?['father']['id'])!);
                          widget.graph.removeNode(Node.Id(widget.nodeValue?['mother']['id'])!);
                        } else {
                          widget.graph.addEdge(Node.Id(widget.nodeValue?['id']), Node.Id(widget.nodeValue?['father']['id']));
                          widget.graph.addEdge(Node.Id(widget.nodeValue?['id']), Node.Id(widget.nodeValue?['mother']['id']));
                        }
                        widget.graph.notifyGraphObserver();
                      }),
                      style: ElevatedButton.styleFrom(elevation: 0),
                      child: Icon(activated ? Icons.arrow_upward : Icons.arrow_downward),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(color: Modular.get<MedicaminaThemeState>().getDarkMode() ? Theme.of(context).primaryColor : const Color.fromRGBO(187, 222, 251, 1), spreadRadius: 1),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(getIcon(gender)),
                            Text(
                              label,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
