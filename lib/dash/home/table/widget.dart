import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashHomeTableWidget extends StatefulWidget {
  const MedicaminaDashHomeTableWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicaminaDashHomeTableWidget();
}

class _MedicaminaDashHomeTableWidget
    extends State<MedicaminaDashHomeTableWidget> {
  late int _rowsPerPage = 8;
  var _availableRowsPerPage = <int>[4, 8, 12, 16];
  var _canChangeRows = true;
  final _searchController = TextEditingController();
  String _searchValue = '';

  void _updateRowsPerPage(val) {
    setState(() {
      _rowsPerPage = val;
    });
  }

  void _updateSearchValue(val) {
    setState(() {
      _searchValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var rowsSet = false;

    if (width <= 300) {
      if (height <= 600) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 2;
            _availableRowsPerPage = [2];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }

      if (height <= 700) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 3;
            _availableRowsPerPage = [3];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }

      if (height <= 1000) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 4;
            _availableRowsPerPage = [4];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }
    }

    if (width <= 500) {
      if (height <= 600) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 2;
            _availableRowsPerPage = [2];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }

      if (height <= 700) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 3;
            _availableRowsPerPage = [3];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }

      if (height <= 1000) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 5;
            _availableRowsPerPage = [5];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }

      if (height <= 2000) {
        if (!rowsSet) {
          setState(() {
            _rowsPerPage = 6;
            _availableRowsPerPage = [6];
            _canChangeRows = false;
          });
          rowsSet = true;
        }
      }
    }

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: ListTile(
            title: Text(
              'Genetic disease threat',
              style: TextStyle(
                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                        suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.search)),
                      ),
                      controller: _searchController,
                      onChanged: _updateSearchValue,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Theme(
                    data: Modular.get<MedicaminaThemeState>().getDarkMode()
                        ? ThemeData.dark().copyWith(
                            // textTheme: GoogleFonts.robotoTextTheme(),
                            cardTheme: CardTheme(
                              // color: Color.fromARGB(255, 52, 52, 52),
                              color: Color.fromARGB(255, 60, 60, 60),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 110, 110, 110),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )
                        : ThemeData.light().copyWith(
                            textTheme: GoogleFonts.robotoTextTheme(),
                            cardTheme: CardTheme(
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                    child: PaginatedDataTable(
                      showCheckboxColumn: false,
                      dataRowMinHeight: MediaQuery.of(context).size.width >=
                              1000
                          ? kMinInteractiveDimension
                          : MediaQuery.of(context).size.width >= 800
                              ? kMinInteractiveDimension + 10
                              : MediaQuery.of(context).size.width >= 600
                                  ? kMinInteractiveDimension + 20
                                  : MediaQuery.of(context).size.width >= 500
                                      ? kMinInteractiveDimension + 30
                                      : MediaQuery.of(context).size.width >= 400
                                          ? kMinInteractiveDimension + 35
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? kMinInteractiveDimension + 50
                                              : kMinInteractiveDimension + 60,
                      dataRowMaxHeight: MediaQuery.of(context).size.width >=
                              1000
                          ? kMinInteractiveDimension
                          : MediaQuery.of(context).size.width >= 800
                              ? kMinInteractiveDimension + 10
                              : MediaQuery.of(context).size.width >= 600
                                  ? kMinInteractiveDimension + 20
                                  : MediaQuery.of(context).size.width >= 500
                                      ? kMinInteractiveDimension + 30
                                      : MediaQuery.of(context).size.width >= 400
                                          ? kMinInteractiveDimension + 35
                                          : MediaQuery.of(context).size.width >=
                                                  300
                                              ? kMinInteractiveDimension + 50
                                              : kMinInteractiveDimension + 60,
                      rowsPerPage: _rowsPerPage,
                      availableRowsPerPage: _availableRowsPerPage,
                      onRowsPerPageChanged:
                          _canChangeRows ? _updateRowsPerPage : null,
                      columnSpacing: 24,
                      columns: [
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Condition',
                              style: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            width: 58,
                            child: Center(
                              child: Text(
                                'Risk',
                                style: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                      source:
                          ResultsData(context: context, search: _searchValue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ResultsData extends DataTableSource {
  ResultsData({required this.context, required this.search});

  String? search;
  BuildContext context;

  // Generate some made-up data
  final List<Map<String, dynamic>> _data = [
    {
      'condition': '1p36 deletion syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '1q21.1 deletion syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '2q37 deletion syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '5q deletion syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '5,10-methenyltetrahydrofolate synthetase deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '17q12 microdeletion syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '17q12 microduplication syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '18p deletion syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '21-hydroxylase deficiency',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alpha 1-antitrypsin deficiency',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'AAA syndrome (achalasia-addisonianism-alacrima syndrome)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Aarskog-Scott syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'ABCD syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Absence deformity of leg-cataract syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Aceruloplasminemia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Acheiropodia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Achondrogenesis type II',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'achondroplasia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Acute intermittent porphyria',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Adenylosuccinate lyase deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Adrenoleukodystrophy',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alagille syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'ADULT syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Aicardi-Goutières syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Albinism',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alexander disease',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alfi\'s syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'alkaptonuria',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alport syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alternating hemiplegia of childhood',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Aortic arch anomaly - peculiar facies - intellectual disability',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Amish lethal microcephaly',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Amyotrophic lateral sclerosis - Frontotemporal dementia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Angel-shaped phalango-epiphyseal dysplasia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alström syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Alzheimer\'s disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Amelogenesis imperfecta',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Aminolevulinic acid dehydratase deficiency porphyria',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Androgen insensitivity syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Angelman syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Aphalangy-syndactyly-microcephaly syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Apert syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Arthrogryposis-renal dysfunction-cholestasis syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ataxia telangiectasia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Axenfeld syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Bainbridge–Ropers syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Beare–Stevenson cutis gyrata syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Beckwith–Wiedemann syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Benjamin syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'biotinidase deficiency',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Björnstad syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Blepharophimosis intellectual disability syndromes',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Bloom syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Birt-Hogg-Dubé syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Brody myopathy',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Brunner syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'CADASIL syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cat eye syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'CRASIL syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Chronic granulomatous disorder',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Campomelic dysplasia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Camptodactyly-taurinuria syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Canavan disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Carpenter Syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'CDKL5 deficiency disorder',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Cerebral dysgenesis-neuropathy-ichthyosis-keratoderma syndrome (CEDNIK)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cleft palate short stature vertebral anomalies syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Combined malonic and methylmalonic aciduria (CMAMMA)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Combined malonic and methylmalonic aciduria (CMAMMA)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Congenital muscular dystrophy-infantile cataract-hypogonadism syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cystic fibrosis',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Charcot-Marie-Tooth disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'CHARGE syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Chédiak-Higashi syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Chondrodysplasia, Grebe type',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cleidocranial dysostosis',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cockayne syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Coffin-Lowry syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cohen syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'collagenopathy, types II and XI',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Congenital insensitivity to pain with anhidrosis (CIPA)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Congenital Muscular Dystrophy',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Corneal dystrophy-perceptive deafness syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cornelia de Lange syndrome (CDLS)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cowden syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'CPO deficiency (coproporphyria)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cranio-lenticulo-sutural dysplasia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cri du chat',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Crohn\'s disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Crouzon syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Crouzonodermoskeletal syndrome (Crouzon syndrome with acanthosis nigricans)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Currarino syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Darier\'s disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Dent\'s disease (Genetic hypercalciuria)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Denys-Drash syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'De Grouchy syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Dolichonychia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Down Syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'DiGeorge syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Distal hereditary motor neuropathies, multiple types',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Distal muscular dystrophy',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Duchenne muscular dystrophy',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Dravet syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ectrodactyly-polydactyly syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Edwards Syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ehlers-Danlos syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Emanuel syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Emery-Dreifuss syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Epidermolysis bullosa',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Erythropoietic protoporphyria',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fanconi anemia (FA)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fabry disease',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Factor V Leiden thrombophilia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fatal familial insomnia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Familial adenomatous polyposis',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Familial dysautonomia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': ',',
    },
    {
      'condition': 'Familial Creutzfeld-Jakob Disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Familial episodic pain syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Familial thoracic aortic aneurysm and aortic dissection',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Feingold syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'FG syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'FBXW7 neurodevelopmental syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fibular aplasia-ectrodactyly syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fine-Lubinsky syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Fragile X syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Friedreich\'s ataxia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'G6PD deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Galactosemia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Gaucher disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Gerstmann-Sträussler-Scheinker syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Gillespie syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Glutaric aciduria, type I and type 2',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'GRACILE syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'GRIN2B-related neurodevelopmental disorder',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Griscelli syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Gustavson syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hailey-Hailey disease',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Harlequin type ichthyosis',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemochromatosis type 1',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemochromatosis type 2A',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemochromatosis type 2B',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Haemochromatosis type 3',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemochromatosis type 4',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemochromatosis type 5',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hemophilia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hepatoerythropoietic porphyria',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hereditary coproporphyria',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Hereditary hemorrhagic telangiectasia(Osler-Weber-Rendu syndrome)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hereditary inclusion body myopathy',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hereditary multiple exostoses',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Hereditary spastic paraplegia (infantile-onset ascending hereditary spastic paralysis)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hermansky-Pudlak syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Hereditary neuropathy with liability to pressure palsies (HNPP)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Heterotaxy',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Homocystinuria',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Huntington\'s disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hunter syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hurler syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hutchinson-Gilford progeria syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hyperlysinemia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hyperoxaluria, primary',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hyperphenylalaninemia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hypoalphalipoproteinemia (Tangier disease)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hypochondrogenesis',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Hypochondroplasia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Immunodeficiency-centromeric instability-facial anomalies syndrome (ICF syndrome)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Incontinentia pigmenti',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Infantile cerebral and cerebellar atrophy with postnatal progressive microcephaly',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ischiopatellar dysplasia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Isodicentric 15',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'PRICKLE1-related progressive myoclonus epilepsy with ataxia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Jackson-Weiss syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Jacobsen syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Joubert syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Juvenile-onset dystonia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Juvenile primary lateral sclerosis (JPLS)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Keloid disorder',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'KIF1A-Associated Neurological Disorder',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Kleefstra syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Kniest dysplasia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Kosaki overgrowth syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Krabbe disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Kufor-Rakeb syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'LCAT deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Lesch-Nyhan syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Li-Fraumeni syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Limb-Girdle Muscular Dystrophy',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Lynch syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Lipoprotein lipase deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Malignant hyperthermia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Maple syrup urine disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Marfan syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Maroteaux-Lamy syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'McCune-Albright syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'McLeod syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'MEDNIK syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Mediterranean fever, familial',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Menkes disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Methemoglobinemia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Methylmalonic acidemia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Micro syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Microcephaly',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Miller-Dieker syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Morquio syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Mowat-Wilson syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Muenke syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Multiple endocrine neoplasia type 1 (Wermer\'s syndrome)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Multiple endocrine neoplasia type 2',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Muscular dystrophy',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Muscular dystrophy, Duchenne and Becker type',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Myostatin-related muscle hypertrophy',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Myotonic dystrophy',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Natowicz syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Nedamss neurodevelopmental disorder',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Neurofibromatosis type I',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Neurofibromatosis type II',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Niemann-Pick disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Nonketotic hyperglycinemia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Nonsyndromic deafness',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Noonan syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Norman-Roberts syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ogden syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Omenn syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Osteogenesis imperfecta',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Ostravik-Lindemann-Solberg syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pantothenate kinase-associated neurodegeneration',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Patau syndrome (Trisomy 13)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'PCC deficiency (propionic acidemia)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Porphyria cutanea tarda (PCT)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pendred syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Peutz-Jeghers syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pfeiffer syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Phelan-McDermid syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Phenylketonuria',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pipecolic acidemia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pitt-Hopkins syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Polycystic kidney disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Polycystic ovary syndrome (PCOS)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Porphyria',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Prader-Willi syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Primary ciliary dyskinesia (PCD)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Primary pulmonary hypertension',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Protein C deficiency',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Protein S deficiency',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Proximal 18q deletion syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pseudo-Gaucher disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Pseudoxanthoma elasticum',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Retinitis pigmentosa',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Rett syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Roberts syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Rubinstein-Taybi syndrome (RSTS)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sandhoff disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sanfilippo syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Scheuermann\'s disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Schwartz-Jampel syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sjogren-Larsson syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Skin fragility-woolly hair-palmoplantar keratoderma syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Spondyloepiphyseal dysplasia congenita (SED)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Shprintzen-Goldberg syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sickle cell anemia',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Siderius X-linked mental retardation syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sideroblastic anemia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sly syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Smith-Lemli-Opitz syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Smith-Magenis syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Snyder-Robinson syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Spinal muscular atrophy',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Spinocerebellar ataxia (types 1-29)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Split hand split foot-nystagmus syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'SSB syndrome (SADDAN)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Stargardt disease (macular degeneration)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Stickler syndrome (multiple forms)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'Strudwick syndrome (spondyloepimetaphyseal dysplasia, Strudwick type)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Tay-Sachs disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Tetrahydrobiopterin deficiency',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Thanatophoric dysplasia',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Thickened earlobes-conductive deafness syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Treacher Collins syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Tuberous sclerosis complex (TSC)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Turner syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Usher syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Variegate porphyria',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Viljoen-Kallis-Voges syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'von Hippel-Lindau disease',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'von Willebrand disease',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Waardenburg syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Warkany syndrome 2',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Weissenbacher-Zweymüller syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Weyer\'s ulnar ray/oligodactyly syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Williams syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Wilson disease',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Woodhouse-Sakati syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Wolf-Hirschhorn syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Xeroderma pigmentosum',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'X-linked intellectual disability and macroorchidism (fragile X syndrome)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition':
          'X-linked spinal-bulbar muscle atrophy (spinal and bulbar muscular atrophy)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Xp11.2 duplication syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'X-linked severe combined immunodeficiency (X-SCID)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'X-linked sideroblastic anemia (XLSA)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': '47,XXX (triple X syndrome)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XXXX syndrome (48, XXXX)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XXXXX syndrome (49,XXXXX)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XXXXY syndrome (49,XXXXY)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XYY syndrome (47,XYY)',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XXYY syndrome (48,XXYY)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XYYY syndrome (48,XYYY)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XXXY syndrome (48,XXXY)',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'XYYYY syndrome (49,XYYYY)',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Zellweger syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Color blindness',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Cri du chat syndrome',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Down syndrome',
      'risk': 'Low',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Familial hypercholesterolemia',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Haemochromatosis type 1',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Klinefelter syndrome',
      'risk': 'High',
      'alt_names': [],
      'conditon_id': '',
    },
    {
      'condition': 'Sickle cell disease',
      'risk': 'Medium',
      'alt_names': [],
      'conditon_id': '',
    },
  ];

  List<Map<String, dynamic>> _searchedData = [];

  int initData() {
    if (search!.isEmpty == true) {
      _searchedData = _data;
      return _searchedData.length;
    }

    for (var i = 0; i < _data.length; i++) {
      if (_data[i]['condition'].toLowerCase().contains(search!.toLowerCase())) {
        _searchedData.add(_data[i]);
      }
      for (var j = 0; j < _data[i]['alt_names'].length; j++) {
        if (_data[i]['alt_names'][j]
            .toLowerCase()
            .contains(search!.toLowerCase())) {
          _searchedData.add(_data[i]);
        }
      }
    }

    return _searchedData.length;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => initData();

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      onSelectChanged: (val) {
        showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(
              title: Text(
                _searchedData[index]['condition'],
              ),
              content: const Text('Some sort of disease'),
            );
          },
        );
      },
      cells: [
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width >= 900
                ? (MediaQuery.of(context).size.width - 32) * 0.8
                : MediaQuery.of(context).size.width >= 600
                    ? (MediaQuery.of(context).size.width - 32) * 0.7
                    : MediaQuery.of(context).size.width >= 400
                        ? (MediaQuery.of(context).size.width - 32) * 0.6
                        : MediaQuery.of(context).size.width >= 300
                            ? (MediaQuery.of(context).size.width - 32) * 0.6
                            : MediaQuery.of(context).size.width >= 100
                                ? (MediaQuery.of(context).size.width - 32) * 0.4
                                : 0,
            child: Wrap(
              children: [Text(_searchedData[index]['condition'].toString())],
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 58,
            child: Center(
              child: Text(
                _searchedData[index]['risk'].toString(),
                style: TextStyle(
                  color: _searchedData[index]['risk'].toString() == 'High'
                      ? Colors.red
                      : null,
                  fontWeight: _searchedData[index]['risk'].toString() == 'High'
                      ? FontWeight.bold
                      : null,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
