import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:medicamina/app/dash/health/chart/desktop.dart';
import 'package:medicamina/app/states.dart';

class MedicaminaDashHealthDesktopWidget extends StatefulWidget {
  const MedicaminaDashHealthDesktopWidget({Key? key}) : super(key: key);

  @override
  State<MedicaminaDashHealthDesktopWidget> createState() => _MedicaminaDashHealthDesktopWidgetState();
}

class _MedicaminaDashHealthDesktopWidgetState extends State<MedicaminaDashHealthDesktopWidget> {
  late DateTime _date = DateTime.now();
  late Text _dateText;
  late bool _showHeartRate = true;

  TextStyle getDateTextStyle() {
    return TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold, letterSpacing: 0.5, fontSize: 16);
  }

  @override
  void initState() {
    super.initState();
    updateDate();
  }

  void updateDate() {
    _dateText = Text(DateFormat('EEEE, dd MMM yyyy').format(_date), style: getDateTextStyle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 320,
                                child: _dateText,
                              ),
                              Expanded(child: Container()),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _date = _date.subtract(const Duration(days: 1));
                                  });
                                  updateDate();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.arrow_back,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: 5),
                                    Text('Previous day'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              OutlinedButton(
                                onPressed: DateUtils.dateOnly(_date).isBefore(DateUtils.dateOnly(DateTime.now()))
                                    ? () {
                                        setState(() {
                                          _date = _date.add(const Duration(days: 1));
                                        });
                                        updateDate();
                                      }
                                    : null,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Next day'),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              OutlinedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime.now(),
                                  ).then((date) {
                                    setState(() {
                                      _date = date!;
                                    });
                                    updateDate();
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Select day'),
                                    SizedBox(width: 5),
                                    Icon(
                                      CommunityMaterialIcons.calendar_month,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              OutlinedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Switch to weekly view'),
                                    SizedBox(width: 5),
                                    Icon(
                                      CommunityMaterialIcons.toggle_switch,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      height: 40,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // Left
                    flex: 7,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 235,
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        const Icon(
                                                          Icons.sports_martial_arts,
                                                          size: 140,
                                                          color: Colors.redAccent,
                                                        ),
                                                        Text(
                                                          'Walking',
                                                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                                                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                              ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.zero,
                                                      child: Text(
                                                        '70%',
                                                        style: TextStyle(
                                                            color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
                                                            fontSize: 22,
                                                            fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.003),
                                                    Text(
                                                      'of daily target',
                                                      style: TextStyle(
                                                        color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '9386',
                                                      style: TextStyle(
                                                        fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                        fontSize: 34,
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.003),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text(
                                                        'steps',
                                                        style: TextStyle(
                                                          color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '4.8',
                                                      style: TextStyle(
                                                        fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                        fontSize: 34,
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.003),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 12),
                                                      child: Text(
                                                        'km',
                                                        style: TextStyle(
                                                          color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 235,
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        const Icon(
                                                          Icons.monitor_heart_outlined,
                                                          size: 140,
                                                          color: Colors.redAccent,
                                                        ),
                                                        Text(
                                                          'Heart rate',
                                                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                                                fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                              ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.zero,
                                                      child: Text(
                                                        'Healthy',
                                                        style: TextStyle(
                                                          color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
                                                          fontSize: 22,
                                                          fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '80',
                                                      style: TextStyle(
                                                        fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                                        fontSize: 34,
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.003),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text(
                                                        'bpm',
                                                        style: TextStyle(
                                                          color: Modular.get<MedicaminaThemeState>().getDarkMode() ? null : Colors.black54,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 400,
                                child: Card(
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          _showHeartRate ? 'Heart rate' : 'Daily activity',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size.fromHeight(344),
                                            child: Padding(
                                              padding: const EdgeInsets.all(30),
                                              child: TestLineChart(showHeartRate: _showHeartRate),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(2),
                                                child: SizedBox.fromSize(
                                                  size: const Size(84, 84),
                                                  child: ClipOval(
                                                    child: Material(
                                                      child: InkWell(
                                                        radius: 84,
                                                        onTap: () {
                                                          setState(() {
                                                            _showHeartRate = true;
                                                          });
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                              CommunityMaterialIcons.heart,
                                                              size: _showHeartRate ? 33 : 20,
                                                              color: _showHeartRate ? Colors.redAccent : Colors.black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2),
                                                child: SizedBox.fromSize(
                                                  size: const Size(84, 84),
                                                  child: ClipOval(
                                                    child: Material(
                                                      child: InkWell(
                                                        radius: 84,
                                                        onTap: () {
                                                          setState(() {
                                                            _showHeartRate = false;
                                                          });
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                              CommunityMaterialIcons.shoe_print,
                                                              size: !_showHeartRate ? 33 : 20,
                                                              color: !_showHeartRate ? Colors.redAccent : Colors.black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // Right
                    flex: 1,
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12, top: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Text(
                                'Record activity',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.stethoscope),
                                        SizedBox(height: 2),
                                        Text('Heart rate', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center), // <-- Text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.scale),
                                        SizedBox(height: 2),
                                        Text('Weight', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.av_timer),
                                        SizedBox(height: 2),
                                        Text('Blood pressure', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.human_male_height),
                                        SizedBox(height: 2),
                                        Text('Height', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.weight_lifter),
                                        SizedBox(height: 2),
                                        Text('Exercise', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox.fromSize(
                              size: const Size(84, 84),
                              child: ClipOval(
                                child: Material(
                                  child: InkWell(
                                    radius: 84,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CommunityMaterialIcons.sleep),
                                        SizedBox(height: 2),
                                        Text('Sleep', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Recommendations',
                              style: TextStyle(fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode() ? FontWeight.normal : FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(Icons.fastfood, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Nutrition', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(CommunityMaterialIcons.bed, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Sleep', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(CommunityMaterialIcons.run, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Exercises', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(CommunityMaterialIcons.head_snowflake_outline, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Mindfulness', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(Icons.emoji_events_outlined, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Set goals', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox.fromSize(
                                            size: const Size(120, 120),
                                            child: ClipOval(
                                              child: Material(
                                                child: InkWell(
                                                  radius: 120,
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(Icons.question_answer, size: 66),
                                                      SizedBox(height: 2),
                                                      Text('Questions', style: TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 6)),
            ],
          ),
        ),
      ),
    );
  }
}
