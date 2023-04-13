import 'dart:math';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TestLineChart extends StatelessWidget {
  TestLineChart({Key? key, required this.showHeartRate}) : super(key: key);

  final _heartRates = <int>[64, 88, 71, 50, 88, 89, 94, 101, 112, 117, 121, 126, 130, 110, 160, 168, 172, 173, 174, 186, 196, 201, 205, 210];
  final _steps = <int>[3, 354, 368, 385, 388, 425, 527, 678, 742, 890, 912, 1020, 1023, 1091, 1191, 1245, 1270, 1362, 1450, 1555, 1664, 1740, 1773, 1857];

  final bool showHeartRate;

  @override
  Widget build(BuildContext context) {
    // Heart rate calculations
    // _heartRates.removeWhere((element) => element <= 10);
    _heartRates.shuffle();
    double _highestHeartRate = _heartRates.reduce(max) + 0.0;
    double _highestHeartRateforChart = _highestHeartRate + _highestHeartRate;
    double _lowestHeartRate = _heartRates.reduce(min) + 0.0;
    double _lowestHeartRateforChart = _lowestHeartRate - _lowestHeartRate;
    var heartRates = _heartRates.mapIndexed((index, element) {
      return FlSpot(index + 1.0, element + 0.0);
    }).toList();
    // Foot step calculations
    _steps.shuffle();
    double _highestSteps = _steps.reduce(max) + 0.0;
    double _highestStepsforChart = _highestSteps + _highestSteps;
    double _lowestSteps = _steps.reduce(min) + 0.0;
    double _lowestStepsforChart = _lowestSteps - _lowestSteps - 200;
    var steps = _steps.mapIndexed((index, element) {
      return FlSpot(index + 1.0, element + 0.0);
    }).toList();

    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            showOnTopOfTheChartBoxArea: false,
            tooltipBgColor: const Color.fromRGBO(97, 97, 97, 1),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((e) {
                return LineTooltipItem(e.y.toString() + ' ' + (showHeartRate ? 'bpm' : 'steps'), const TextStyle(color: Colors.white));
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
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('2am'),);
                  }
                  if (value == 5) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('5am'),);
                  }
                  if (value == 8) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('8am'),);
                  }
                  if (value == 11) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('11am'),);
                  }
                  if (value == 14) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('2pm'),);
                  }
                  if (value == 17) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('5pm'),);
                  }
                  if (value == 20) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('8pm'),);
                  }
                  if (value == 23) {
                    return const Padding(padding: EdgeInsets.only(top: 0), child: Text('11pm'),);
                  }
                  return const Text('');
                },
              ),
            )),
        borderData: FlBorderData(show: false),
        minX: 1,
        maxX: 24,
        minY: showHeartRate ? _lowestHeartRateforChart : _lowestStepsforChart,
        maxY: showHeartRate ? _highestHeartRateforChart : _highestStepsforChart,
        lineBarsData: [
          LineChartBarData(
            curveSmoothness: 0.45,
            isCurved: true,
            dotData: FlDotData(show: false),
            color: Theme.of(context).colorScheme.tertiary,
            spots: showHeartRate
                ?  heartRates : steps,
          ),
        ],
      ),
    );
  }
}
