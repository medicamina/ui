import 'package:flutter/material.dart';
import 'package:medicamina/dash/map/choropleth_map.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (900 > MediaQuery.of(context).size.width) {
      return mobile(context);
    }
    return desktop(context);
  }
}

Widget _map(BuildContext context) {
  return Expanded(
    child: Card(
      semanticContainer: true,
      child: Column(
        children: const [
          ListTile(
            title: Text(
              'Your ancestry',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ChoroplethMap(),
        ],
      ),
    ),
  );
}

Widget _personalDetails(BuildContext context) {
  return Expanded(
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Personal data',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Name'),
            subtitle: Text("Jake Spencer Walklate"),
          ),
          const ListTile(
            leading: Icon(Icons.cake),
            title: Text('Birthdate'),
            subtitle: Text("26 Jun 1997"),
          ),
          const ListTile(
            leading: Icon(Icons.bloodtype),
            title: Text('Blood type'),
            subtitle: Text("O+"),
          ),
          const ListTile(
            leading: Icon(Icons.height),
            title: Text('Height'),
            subtitle: Text("5\"5' [165cm]"),
          ),
          const ListTile(
            leading: Icon(Icons.scale),
            title: Text('Weight'),
            subtitle: Text("132lb [60kg]"),
          ),
        ],
      ),
    ),
  );
}

class ResultsTable extends StatefulWidget {
  const ResultsTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultsTableState();
}

class _ResultsTableState extends State<ResultsTable> {
  var _searchTerm = '';

  void updateSearch(val) {
    setState(() {
      _searchTerm = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                  onChanged: (val) => updateSearch(val),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return PaginatedDataTable(
                    source: ResultsData(search: _searchTerm),
                    columns: [
                      DataColumn(
                        label: Expanded(
                          flex: 1,
                          child: Text(
                            'Condition',
                            style: Theme.of(context).textTheme.titleSmall?.apply(
                                  fontWeightDelta: 1,
                                  color: Colors.black54,
                                ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Risk',
                              style: Theme.of(context).textTheme.titleSmall?.apply(
                                    fontWeightDelta: 1,
                                    color: Colors.black54,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    columnSpacing: constraints.maxWidth * 0.5,
                    horizontalMargin: 10,
                    rowsPerPage: 4,
                    showCheckboxColumn: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsData extends DataTableSource {
  ResultsData({this.search});

  String? search;

  // Generate some made-up data
  final List<Map<String, dynamic>> _data = [
    {'condition': "A1AT deficiency", 'risk': "High"},
    {'condition': "Type 2 diabetes", 'risk': "Medium"},
    {'condition': "Cystic fibrosis", 'risk': "Low"},
    {'condition': "Latex allergy", 'risk': "Low"},
    {'condition': "Tachycardia", 'risk': "Low"},
  ];

  List<Map<String, dynamic>> _searchedData = [];

  int initSearchedData() {
    if (search!.isEmpty == true) {
      _searchedData = _data;
      return _searchedData.length;
    }

    for (var i = 0; i < _data.length; i++) {
      if (_data[i]['condition'].toLowerCase().contains(search!.toLowerCase())) {
        _searchedData.add(_data[i]);
      }
    }
    return _searchedData.length;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => initSearchedData();

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          Text(_searchedData[index]['condition'].toString()),
        ),
        DataCell(
          Center(
            child: Text(_searchedData[index]['risk']),
          ),
        ),
      ],
    );
  }
}

Widget mobile(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          children: [_map(context)],
        ),
        Row(
          children: [_personalDetails(context)],
        ),
        Row(
          children: const [ResultsTable()],
        ),
      ],
    ),
  );
}

Widget desktop(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          children: [
            _map(context),
            _personalDetails(context),
          ],
        ),
        Row(
          children: const [ResultsTable()],
        ),
      ],
    ),
  );
}
