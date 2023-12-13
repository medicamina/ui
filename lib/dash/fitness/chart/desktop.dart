import 'dart:math';
import 'package:collection/collection.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Medicamina
import 'package:medicamina_ui/states.dart';

class MedicaminaDashFitnessActivityLineChart extends StatelessWidget {
  MedicaminaDashFitnessActivityLineChart({Key? key}) : super(key: key);

  final _heartRates = <int>[
    20,
    64,
    88,
    71,
    50,
    88,
    89,
    94,
    101,
    112,
    117,
    121,
    126,
    130,
    110,
    160,
    172,
    173,
    174,
    186,
    196,
    201,
    205,
    210
  ];

  @override
  Widget build(BuildContext context) {
    // Heart rate calculations
    _heartRates.shuffle();
    double _highestHeartRate = _heartRates.reduce(max) + 0.0;
    double _highestHeartRateforChart =
        _highestHeartRate + _highestHeartRate / 2;
    double _lowestHeartRate = _heartRates.reduce(min) + 0.0;
    double _lowestHeartRateforChart = _lowestHeartRate - _lowestHeartRate;
    var heartRates = _heartRates.mapIndexed((index, element) {
      return FlSpot(index + 1.0, element + 0.0);
    }).toList();

    while (_heartRates.length > 24) {
      _heartRates.removeLast();
    }

    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                'Activity',
                style: TextStyle(
                  fontWeight: Modular.get<MedicaminaThemeState>().getDarkMode()
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CommunityMaterialIcons.map_search_outline))
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width >= 1000 ? 300 : 200,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      showOnTopOfTheChartBoxArea: false,
                      tooltipBgColor: const Color.fromRGBO(97, 97, 97, 1),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((e) {
                          return LineTooltipItem(e.y.toString() + ' bpm',
                              const TextStyle(color: Colors.white));
                        }).toList();
                      },
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value == 2) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('2am',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 5) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('5am',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 8) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('8am',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 11) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('11am',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 14) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('2pm',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 17) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('5pm',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 20) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('8pm',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          if (value == 23) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text('11pm',
                                  style: Theme.of(context).textTheme.caption),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 1,
                  maxX: 24,
                  minY: _lowestHeartRateforChart,
                  maxY: _highestHeartRateforChart - 50,
                  lineBarsData: [
                    LineChartBarData(
                      curveSmoothness: 0.45,
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      color: Theme.of(context).colorScheme.secondary,
                      spots: heartRates,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
