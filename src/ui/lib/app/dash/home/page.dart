import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicamina/app/states.dart';
import 'package:medicamina/app/dash/home/map/choropleth_map.dart';

class MedicaminaDashHome extends StatelessWidget {
  const MedicaminaDashHome({Key? key}) : super(key: key);

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
        children: [
          ListTile(
            title: Text(
              'Your ancestry',
              style: TextStyle(
                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            // trailing: IconButton(
            //   icon: const Icon(Icons.question_mark),
            //   onPressed: () {
            //   },
            // ),
          ),
          const Padding(padding: EdgeInsets.only(top: 32)),
          const ChoroplethMap(),
          const Padding(padding: EdgeInsets.only(bottom: 32)),
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
            title: Text(
              'Personal details',
              style: TextStyle(
                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            // trailing: IconButton(
            //   icon: const Icon(Icons.edit),
            //   onPressed: () {

            //   },
            // ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Name'),
            subtitle: Text("Jake Spencer Walklate"),
          ),
          const ListTile(
            leading: Icon(CommunityMaterialIcons.gender_male_female),
            title: Text('Gender'),
            subtitle: Text('M'),
          ),
          const ListTile(
            leading: Icon(Icons.cake),
            title: Text('Birthdate'),
            subtitle: Text('26 Jun 1997'),
          ),
          const ListTile(
            leading: Icon(Icons.bloodtype),
            title: Text('Blood type'),
            subtitle: Text('O+'),
          ),
          const ListTile(
            leading: Icon(Icons.height),
            title: Text('Height'),
            subtitle: Text('5"5\' [165cm]'),
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
  final int _defaultRowsPerPage = 4;
  late int _rowsPerPage;
  final _searchController = TextEditingController();
  String _searchValue = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _rowsPerPage = _defaultRowsPerPage;
    });
  }

  void updateRowsPerPage(val) {
    setState(() {
      _rowsPerPage = val;
    });
  }

  void updateSearchValue(val) {
    setState(() {
      _searchValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    suffixIcon: Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.search)),
                  ),
                  controller: _searchController,
                  onChanged: updateSearchValue,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: Theme(
                data: Modular.get<MedicaminaThemeState>().getDarkMode()
                    ? ThemeData.dark().copyWith(
                        cardTheme: CardTheme(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white12, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      )
                    : ThemeData.light().copyWith(
                        cardTheme: CardTheme(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                child: PaginatedDataTable(
                  dataRowHeight: MediaQuery.of(context).size.width < 600 ? 72 : kMinInteractiveDimension,
                  rowsPerPage: MediaQuery.of(context).size.width < 600 ? 6 : _rowsPerPage,
                  onRowsPerPageChanged: MediaQuery.of(context).size.width < 600 ? null : updateRowsPerPage,
                  availableRowsPerPage: MediaQuery.of(context).size.width < 600 ? [6] : [_defaultRowsPerPage, _defaultRowsPerPage * 2, _defaultRowsPerPage * 3],
                  columnSpacing: 24,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 100,
                        child: Text(
                          'Condition',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Center(
                          child: Text(
                            'Risk',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                    ),
                  ],
                  source: ResultsData(context: context, search: _searchValue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsData extends DataTableSource {
  ResultsData({required this.context, required this.search});

  String? search;
  BuildContext context;

  // Generate some made-up data
  final List<Map<String, dynamic>> _data = [
    {"condition": "1p36 deletion syndrome", "risk": "High", "alt_names": []},
    {"condition": "1q21.1 deletion syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "2q37 deletion syndrome", "risk": "Low", "alt_names": []},
    {"condition": "5q deletion syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "5,10-methenyltetrahydrofolate synthetase deficiency", "risk": "Low", "alt_names": []},
    {"condition": "17q12 microdeletion syndrome", "risk": "High", "alt_names": []},
    {"condition": "17q12 microduplication syndrome", "risk": "Low", "alt_names": []},
    {"condition": "18p deletion syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "21-hydroxylase deficiency", "risk": "High", "alt_names": []},
    {"condition": "Alpha 1-antitrypsin deficiency", "risk": "High", "alt_names": []},
    {"condition": "AAA syndrome (achalasia–addisonianism–alacrima syndrome)", "risk": "Low", "alt_names": []},
    {"condition": "Aarskog–Scott syndrome", "risk": "Low", "alt_names": []},
    {"condition": "ABCD syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Absence deformity of leg-cataract syndrome", "risk": "High", "alt_names": []},
    {"condition": "Aceruloplasminemia", "risk": "Medium", "alt_names": []},
    {"condition": "Acheiropodia", "risk": "High", "alt_names": []},
    {"condition": "Achondrogenesis type II", "risk": "Medium", "alt_names": []},
    {"condition": "achondroplasia", "risk": "Low", "alt_names": []},
    {"condition": "Acute intermittent porphyria", "risk": "High", "alt_names": []},
    {"condition": "Adenylosuccinate lyase deficiency", "risk": "Low", "alt_names": []},
    {"condition": "Adrenoleukodystrophy", "risk": "High", "alt_names": []},
    {"condition": "Alagille syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "ADULT syndrome", "risk": "High", "alt_names": []},
    {"condition": "Aicardi–Goutières syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Albinism", "risk": "Low", "alt_names": []},
    {"condition": "Alexander disease", "risk": "Medium", "alt_names": []},
    {"condition": "Alfi's syndrome", "risk": "Low", "alt_names": []},
    {"condition": "alkaptonuria", "risk": "High", "alt_names": []},
    {"condition": "Alport syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Alternating hemiplegia of childhood", "risk": "Medium", "alt_names": []},
    {"condition": "Aortic arch anomaly - peculiar facies - intellectual disability", "risk": "High", "alt_names": []},
    {"condition": "Amish lethal microcephaly", "risk": "High", "alt_names": []},
    {"condition": "Amyotrophic lateral sclerosis – Frontotemporal dementia", "risk": "Low", "alt_names": []},
    {"condition": "Angel-shaped phalango-epiphyseal dysplasia", "risk": "Low", "alt_names": []},
    {"condition": "Alström syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Alzheimer's disease", "risk": "High", "alt_names": []},
    {"condition": "Amelogenesis imperfecta", "risk": "Medium", "alt_names": []},
    {"condition": "Aminolevulinic acid dehydratase deficiency porphyria", "risk": "High", "alt_names": []},
    {"condition": "Androgen insensitivity syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Angelman syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Aphalangy-syndactyly-microcephaly syndrome", "risk": "High", "alt_names": []},
    {"condition": "Apert syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Arthrogryposis–renal dysfunction–cholestasis syndrome", "risk": "High", "alt_names": []},
    {"condition": "Ataxia telangiectasia", "risk": "Medium", "alt_names": []},
    {"condition": "Axenfeld syndrome", "risk": "High", "alt_names": []},
    {"condition": "Bainbridge–Ropers syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Beare–Stevenson cutis gyrata syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Beckwith–Wiedemann syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Benjamin syndrome", "risk": "Low", "alt_names": []},
    {"condition": "biotinidase deficiency", "risk": "High", "alt_names": []},
    {"condition": "Björnstad syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Blepharophimosis intellectual disability syndromes", "risk": "Medium", "alt_names": []},
    {"condition": "Bloom syndrome", "risk": "High", "alt_names": []},
    {"condition": "Birt–Hogg–Dubé syndrome", "risk": "High", "alt_names": []},
    {"condition": "Brody myopathy", "risk": "Low", "alt_names": []},
    {"condition": "Brunner syndrome", "risk": "Low", "alt_names": []},
    {"condition": "CADASIL syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Cat eye syndrome", "risk": "High", "alt_names": []},
    {"condition": "CRASIL syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Chronic granulomatous disorder", "risk": "High", "alt_names": []},
    {"condition": "Campomelic dysplasia", "risk": "Medium", "alt_names": []},
    {"condition": "Camptodactyly-taurinuria syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Canavan disease", "risk": "High", "alt_names": []},
    {"condition": "Carpenter Syndrome", "risk": "Low", "alt_names": []},
    {"condition": "CDKL5 deficiency disorder", "risk": "High", "alt_names": []},
    {"condition": "Cerebral dysgenesis–neuropathy–ichthyosis–keratoderma syndrome (CEDNIK)", "risk": "Medium", "alt_names": []},
    {"condition": "Cleft palate short stature vertebral anomalies syndrome", "risk": "High", "alt_names": []},
    {"condition": "Combined malonic and methylmalonic aciduria (CMAMMA)", "risk": "Medium", "alt_names": []},
    {"condition": "Combined malonic and methylmalonic aciduria (CMAMMA)", "risk": "Low", "alt_names": []},
    {"condition": "Congenital muscular dystrophy-infantile cataract-hypogonadism syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Cystic fibrosis", "risk": "Low", "alt_names": []},
    {"condition": "Charcot–Marie–Tooth disease", "risk": "High", "alt_names": []},
    {"condition": "CHARGE syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Chédiak–Higashi syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Chondrodysplasia, Grebe type", "risk": "High", "alt_names": []},
    {"condition": "Cleidocranial dysostosis", "risk": "High", "alt_names": []},
    {"condition": "Cockayne syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Coffin–Lowry syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Cohen syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "collagenopathy, types II and XI", "risk": "High", "alt_names": []},
    {"condition": "Congenital insensitivity to pain with anhidrosis (CIPA)", "risk": "Medium", "alt_names": []},
    {"condition": "Congenital Muscular Dystrophy", "risk": "High", "alt_names": []},
    {"condition": "Corneal dystrophy-perceptive deafness syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Cornelia de Lange syndrome (CDLS)", "risk": "Low", "alt_names": []},
    {"condition": "Cowden syndrome", "risk": "High", "alt_names": []},
    {"condition": "CPO deficiency (coproporphyria)", "risk": "Low", "alt_names": []},
    {"condition": "Cranio-lenticulo-sutural dysplasia", "risk": "High", "alt_names": []},
    {"condition": "Cri du chat", "risk": "Medium", "alt_names": []},
    {"condition": "Crohn's disease", "risk": "High", "alt_names": []},
    {"condition": "Crouzon syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Crouzonodermoskeletal syndrome (Crouzon syndrome with acanthosis nigricans)", "risk": "Low", "alt_names": []},
    {"condition": "Currarino syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Darier's disease", "risk": "Low", "alt_names": []},
    {"condition": "Dent's disease (Genetic hypercalciuria)", "risk": "High", "alt_names": []},
    {"condition": "Denys–Drash syndrome", "risk": "Low", "alt_names": []},
    {"condition": "De Grouchy syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Dolichonychia", "risk": "High", "alt_names": []},
    {"condition": "Down Syndrome", "risk": "High", "alt_names": []},
    {"condition": "DiGeorge syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Distal hereditary motor neuropathies, multiple types", "risk": "Low", "alt_names": []},
    {"condition": "Distal muscular dystrophy", "risk": "Medium", "alt_names": []},
    {"condition": "Duchenne muscular dystrophy", "risk": "High", "alt_names": []},
    {"condition": "Dravet syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Ectrodactyly-polydactyly syndrome", "risk": "High", "alt_names": []},
    {"condition": "Edwards Syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Ehlers–Danlos syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Emanuel syndrome", "risk": "High", "alt_names": []},
    {"condition": "Emery–Dreifuss syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Epidermolysis bullosa", "risk": "High", "alt_names": []},
    {"condition": "Erythropoietic protoporphyria", "risk": "Medium", "alt_names": []},
    {"condition": "Fanconi anemia (FA)", "risk": "High", "alt_names": []},
    {"condition": "Fabry disease", "risk": "Medium", "alt_names": []},
    {"condition": "Factor V Leiden thrombophilia", "risk": "Low", "alt_names": []},
    {"condition": "Fatal familial insomnia", "risk": "Medium", "alt_names": []},
    {"condition": "Familial adenomatous polyposis", "risk": "Low", "alt_names": []},
    {"condition": "Familial dysautonomia", "risk": "High", "alt_names": []},
    {"condition": "Familial Creutzfeld–Jakob Disease", "risk": "Low", "alt_names": []},
    {"condition": "Familial episodic pain syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Familial thoracic aortic aneurysm and aortic dissection", "risk": "High", "alt_names": []},
    {"condition": "Feingold syndrome", "risk": "High", "alt_names": []},
    {"condition": "FG syndrome", "risk": "High", "alt_names": []},
    {"condition": "FBXW7 neurodevelopmental syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Fibular aplasia-ectrodactyly syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Fine-Lubinsky syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Fragile X syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Friedreich's ataxia", "risk": "High", "alt_names": []},
    {"condition": "G6PD deficiency", "risk": "Low", "alt_names": []},
    {"condition": "Galactosemia", "risk": "Medium", "alt_names": []},
    {"condition": "Gaucher disease", "risk": "High", "alt_names": []},
    {"condition": "Gerstmann–Sträussler–Scheinker syndrome", "risk": "High", "alt_names": []},
    {"condition": "Gillespie syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Glutaric aciduria, type I and type 2", "risk": "Low", "alt_names": []},
    {"condition": "GRACILE syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "GRIN2B-related neurodevelopmental disorder", "risk": "High", "alt_names": []},
    {"condition": "Griscelli syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Gustavson syndrome", "risk": "High", "alt_names": []},
    {"condition": "Hailey–Hailey disease", "risk": "Medium", "alt_names": []},
    {"condition": "Harlequin type ichthyosis", "risk": "Low", "alt_names": []},
    {"condition": "Hemochromatosis type 1", "risk": "High", "alt_names": []},
    {"condition": "Hemochromatosis type 2A", "risk": "Low", "alt_names": []},
    {"condition": "Hemochromatosis type 2B", "risk": "High", "alt_names": []},
    {"condition": "Haemochromatosis type 3", "risk": "Medium", "alt_names": []},
    {"condition": "Hemochromatosis type 4", "risk": "High", "alt_names": []},
    {"condition": "Hemochromatosis type 5", "risk": "Medium", "alt_names": []},
    {"condition": "Hemophilia", "risk": "Low", "alt_names": []},
    {"condition": "Hepatoerythropoietic porphyria", "risk": "Medium", "alt_names": []},
    {"condition": "Hereditary coproporphyria", "risk": "Low", "alt_names": []},
    {"condition": "Hereditary hemorrhagic telangiectasia(Osler–Weber–Rendu syndrome)", "risk": "High", "alt_names": []},
    {"condition": "Hereditary inclusion body myopathy", "risk": "Low", "alt_names": []},
    {"condition": "Hereditary multiple exostoses", "risk": "Medium", "alt_names": []},
    {"condition": "Hereditary spastic paraplegia (infantile-onset ascending hereditary spastic paralysis)", "risk": "High", "alt_names": []},
    {"condition": "Hermansky–Pudlak syndrome", "risk": "High", "alt_names": []},
    {"condition": "Hereditary neuropathy with liability to pressure palsies (HNPP)", "risk": "Low", "alt_names": []},
    {"condition": "Heterotaxy", "risk": "Low", "alt_names": []},
    {"condition": "Homocystinuria", "risk": "Medium", "alt_names": []},
    {"condition": "Huntington's disease", "risk": "High", "alt_names": []},
    {"condition": "Hunter syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Hurler syndrome", "risk": "High", "alt_names": []},
    {"condition": "Hutchinson–Gilford progeria syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Hyperlysinemia", "risk": "Low", "alt_names": []},
    {"condition": "Hyperoxaluria, primary", "risk": "High", "alt_names": []},
    {"condition": "Hyperphenylalaninemia", "risk": "Low", "alt_names": []},
    {"condition": "Hypoalphalipoproteinemia (Tangier disease)", "risk": "High", "alt_names": []},
    {"condition": "Hypochondrogenesis", "risk": "Medium", "alt_names": []},
    {"condition": "Hypochondroplasia", "risk": "High", "alt_names": []},
    {"condition": "Immunodeficiency–centromeric instability–facial anomalies syndrome (ICF syndrome)", "risk": "Medium", "alt_names": []},
    {"condition": "Incontinentia pigmenti", "risk": "Low", "alt_names": []},
    {"condition": "Infantile cerebral and cerebellar atrophy with postnatal progressive microcephaly", "risk": "Medium", "alt_names": []},
    {"condition": "Ischiopatellar dysplasia", "risk": "Low", "alt_names": []},
    {"condition": "Isodicentric 15", "risk": "High", "alt_names": []},
    {"condition": "PRICKLE1-related progressive myoclonus epilepsy with ataxia", "risk": "Low", "alt_names": []},
    {"condition": "Jackson–Weiss syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Jacobsen syndrome", "risk": "High", "alt_names": []},
    {"condition": "Joubert syndrome", "risk": "High", "alt_names": []},
    {"condition": "Juvenile-onset dystonia", "risk": "Low", "alt_names": []},
    {"condition": "Juvenile primary lateral sclerosis (JPLS)", "risk": "Low", "alt_names": []},
    {"condition": "Keloid disorder", "risk": "Medium", "alt_names": []},
    {"condition": "KIF1A-Associated Neurological Disorder", "risk": "High", "alt_names": []},
    {"condition": "Kleefstra syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Kniest dysplasia", "risk": "High", "alt_names": []},
    {"condition": "Kosaki overgrowth syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Krabbe disease", "risk": "Low", "alt_names": []},
    {"condition": "Kufor–Rakeb syndrome", "risk": "High", "alt_names": []},
    {"condition": "LCAT deficiency", "risk": "Low", "alt_names": []},
    {"condition": "Lesch–Nyhan syndrome", "risk": "High", "alt_names": []},
    {"condition": "Li–Fraumeni syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Limb-Girdle Muscular Dystrophy", "risk": "High", "alt_names": []},
    {"condition": "Lynch syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "lipoprotein lipase deficiency", "risk": "Low", "alt_names": []},
    {"condition": "Malignant hyperthermia", "risk": "Medium", "alt_names": []},
    {"condition": "Maple syrup urine disease", "risk": "Low", "alt_names": []},
    {"condition": "Marfan syndrome", "risk": "High", "alt_names": []},
    {"condition": "Maroteaux–Lamy syndrome", "risk": "Low", "alt_names": []},
    {"condition": "McCune–Albright syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "McLeod syndrome", "risk": "High", "alt_names": []},
    {"condition": "MEDNIK syndrome", "risk": "High", "alt_names": []},
    {"condition": "Mediterranean fever, familial", "risk": "Low", "alt_names": []},
    {"condition": "Menkes disease", "risk": "Low", "alt_names": []},
    {"condition": "Methemoglobinemia", "risk": "Medium", "alt_names": []},
    {"condition": "Methylmalonic acidemia", "risk": "High", "alt_names": []},
    {"condition": "Micro syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Microcephaly", "risk": "High", "alt_names": []},
    {"condition": "Miller-Dieker syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Morquio syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Mowat–Wilson syndrome", "risk": "High", "alt_names": []},
    {"condition": "Muenke syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Multiple endocrine neoplasia type 1 (Wermer's syndrome)", "risk": "High", "alt_names": []},
    {"condition": "Multiple endocrine neoplasia type 2", "risk": "Medium", "alt_names": []},
    {"condition": "Muscular dystrophy", "risk": "High", "alt_names": []},
    {"condition": "Muscular dystrophy, Duchenne and Becker type", "risk": "Medium", "alt_names": []},
    {"condition": "Myostatin-related muscle hypertrophy", "risk": "Low", "alt_names": []},
    {"condition": "Myotonic dystrophy", "risk": "Medium", "alt_names": []},
    {"condition": "Natowicz syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Nedamss neurodevelopmental disorder", "risk": "High", "alt_names": []},
    {"condition": "Neurofibromatosis type I", "risk": "Low", "alt_names": []},
    {"condition": "Neurofibromatosis type II", "risk": "Medium", "alt_names": []},
    {"condition": "Niemann–Pick disease", "risk": "High", "alt_names": []},
    {"condition": "Nonketotic hyperglycinemia", "risk": "High", "alt_names": []},
    {"condition": "Nonsyndromic deafness", "risk": "Low", "alt_names": []},
    {"condition": "Noonan syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Norman–Roberts syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Ogden syndrome", "risk": "High", "alt_names": []},
    {"condition": "Omenn syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Osteogenesis imperfecta", "risk": "High", "alt_names": []},
    {"condition": "Ostravik-Lindemann-Solberg syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Pantothenate kinase-associated neurodegeneration", "risk": "Low", "alt_names": []},
    {"condition": "Patau syndrome (Trisomy 13)", "risk": "High", "alt_names": []},
    {"condition": "PCC deficiency (propionic acidemia)", "risk": "Low", "alt_names": []},
    {"condition": "Porphyria cutanea tarda (PCT)", "risk": "High", "alt_names": []},
    {"condition": "Pendred syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Peutz–Jeghers syndrome", "risk": "High", "alt_names": []},
    {"condition": "Pfeiffer syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Phelan-McDermid syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Phenylketonuria", "risk": "Medium", "alt_names": []},
    {"condition": "Pipecolic acidemia", "risk": "Low", "alt_names": []},
    {"condition": "Pitt–Hopkins syndrome", "risk": "High", "alt_names": []},
    {"condition": "Polycystic kidney disease", "risk": "Low", "alt_names": []},
    {"condition": "Polycystic ovary syndrome (PCOS)", "risk": "Medium", "alt_names": []},
    {"condition": "Porphyria", "risk": "High", "alt_names": []},
    {"condition": "Prader–Willi syndrome", "risk": "High", "alt_names": []},
    {"condition": "Primary ciliary dyskinesia (PCD)", "risk": "High", "alt_names": []},
    {"condition": "Primary pulmonary hypertension", "risk": "Medium", "alt_names": []},
    {"condition": "Protein C deficiency", "risk": "Low", "alt_names": []},
    {"condition": "Protein S deficiency", "risk": "Medium", "alt_names": []},
    {"condition": "Proximal 18q deletion syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Pseudo-Gaucher disease", "risk": "High", "alt_names": []},
    {"condition": "Pseudoxanthoma elasticum", "risk": "Low", "alt_names": []},
    {"condition": "Retinitis pigmentosa", "risk": "Medium", "alt_names": []},
    {"condition": "Rett syndrome", "risk": "High", "alt_names": []},
    {"condition": "Roberts syndrome", "risk": "High", "alt_names": []},
    {"condition": "Rubinstein–Taybi syndrome (RSTS)", "risk": "Low", "alt_names": []},
    {"condition": "Sandhoff disease", "risk": "Low", "alt_names": []},
    {"condition": "Sanfilippo syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Scheuermann's disease", "risk": "High", "alt_names": []},
    {"condition": "Schwartz–Jampel syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Sjogren-Larsson syndrome", "risk": "High", "alt_names": []},
    {"condition": "Skin fragility-woolly hair-palmoplantar keratoderma syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Spondyloepiphyseal dysplasia congenita (SED)", "risk": "Low", "alt_names": []},
    {"condition": "Shprintzen–Goldberg syndrome", "risk": "High", "alt_names": []},
    {"condition": "Sickle cell anemia", "risk": "Low", "alt_names": []},
    {"condition": "Siderius X-linked mental retardation syndrome", "risk": "High", "alt_names": []},
    {"condition": "Sideroblastic anemia", "risk": "Medium", "alt_names": []},
    {"condition": "Sly syndrome", "risk": "High", "alt_names": []},
    {"condition": "Smith–Lemli–Opitz syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Smith–Magenis syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Snyder–Robinson syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Spinal muscular atrophy", "risk": "Low", "alt_names": []},
    {"condition": "Spinocerebellar ataxia (types 1–29)", "risk": "High", "alt_names": []},
    {"condition": "Split hand split foot-nystagmus syndrome", "risk": "Low", "alt_names": []},
    {"condition": "SSB syndrome (SADDAN)", "risk": "Medium", "alt_names": []},
    {"condition": "Stargardt disease (macular degeneration)", "risk": "High", "alt_names": []},
    {"condition": "Stickler syndrome (multiple forms)", "risk": "High", "alt_names": []},
    {"condition": "Strudwick syndrome (spondyloepimetaphyseal dysplasia, Strudwick type)", "risk": "Low", "alt_names": []},
    {"condition": "Tay–Sachs disease", "risk": "Low", "alt_names": []},
    {"condition": "Tetrahydrobiopterin deficiency", "risk": "Medium", "alt_names": []},
    {"condition": "Thanatophoric dysplasia", "risk": "High", "alt_names": []},
    {"condition": "Thickened earlobes-conductive deafness syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Treacher Collins syndrome", "risk": "High", "alt_names": []},
    {"condition": "Tuberous sclerosis complex (TSC)", "risk": "Medium", "alt_names": []},
    {"condition": "Turner syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Usher syndrome", "risk": "High", "alt_names": []},
    {"condition": "Variegate porphyria", "risk": "Low", "alt_names": []},
    {"condition": "Viljoen-Kallis-Voges syndrome", "risk": "High", "alt_names": []},
    {"condition": "von Hippel–Lindau disease", "risk": "Medium", "alt_names": []},
    {"condition": "von Willebrand disease", "risk": "High", "alt_names": []},
    {"condition": "Waardenburg syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Warkany syndrome 2", "risk": "Low", "alt_names": []},
    {"condition": "Weissenbacher–Zweymüller syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Weyer's ulnar ray/oligodactyly syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Williams syndrome", "risk": "High", "alt_names": []},
    {"condition": "Wilson disease", "risk": "Low", "alt_names": []},
    {"condition": "Woodhouse–Sakati syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Wolf–Hirschhorn syndrome", "risk": "High", "alt_names": []},
    {"condition": "Xeroderma pigmentosum", "risk": "High", "alt_names": []},
    {"condition": "X-linked intellectual disability and macroorchidism (fragile X syndrome)", "risk": "Low", "alt_names": []},
    {"condition": "X-linked spinal-bulbar muscle atrophy (spinal and bulbar muscular atrophy)", "risk": "Low", "alt_names": []},
    {"condition": "Xp11.2 duplication syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "X-linked severe combined immunodeficiency (X-SCID)", "risk": "High", "alt_names": []},
    {"condition": "X-linked sideroblastic anemia (XLSA)", "risk": "Medium", "alt_names": []},
    {"condition": "47,XXX (triple X syndrome)", "risk": "High", "alt_names": []},
    {"condition": "XXXX syndrome (48, XXXX)", "risk": "Medium", "alt_names": []},
    {"condition": "XXXXX syndrome (49,XXXXX)", "risk": "Low", "alt_names": []},
    {"condition": "XXXXY syndrome (49,XXXXY)", "risk": "High", "alt_names": []},
    {"condition": "XYY syndrome (47,XYY)", "risk": "Low", "alt_names": []},
    {"condition": "XXYY syndrome (48,XXYY)", "risk": "High", "alt_names": []},
    {"condition": "XYYY syndrome (48,XYYY)", "risk": "Medium", "alt_names": []},
    {"condition": "XXXY syndrome (48,XXXY)", "risk": "High", "alt_names": []},
    {"condition": "XYYYY syndrome (49,XYYYY)", "risk": "Medium", "alt_names": []},
    {"condition": "Zellweger syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Color blindness", "risk": "Low", "alt_names": []},
    {"condition": "Cri du chat syndrome", "risk": "Medium", "alt_names": []},
    {"condition": "Down syndrome", "risk": "Low", "alt_names": []},
    {"condition": "Familial hypercholesterolemia", "risk": "Medium", "alt_names": []},
    {"condition": "Haemochromatosis type 1", "risk": "High", "alt_names": []},
    {"condition": "Klinefelter syndrome", "risk": "High", "alt_names": []},
    {"condition": "Sickle cell disease", "risk": "Medium", "alt_names": []},
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
        if (_data[i]['alt_names'][j].toLowerCase().contains(search!.toLowerCase())) {
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
      cells: [
        DataCell(
          SizedBox(
            width: (MediaQuery.of(context).size.width - 32) * 0.6,
            child: Wrap(
              children: [Text(_searchedData[index]['condition'].toString())],
            ),
          ),
        ),
        DataCell(
          Center(child: Text(_searchedData[index]['risk'].toString())),
        )
      ],
    );
  }
}

Widget mobile(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            children: [_map(context)],
          ),
          Row(
            children: [_personalDetails(context)],
          ),
          Row(
            children: const [
              ResultsTable(),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget desktop(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            children: [
              _map(context),
              _personalDetails(context),
            ],
          ),
          Row(
            children: const [
              ResultsTable(),
            ],
          ),
        ],
      ),
    ),
  );
}
