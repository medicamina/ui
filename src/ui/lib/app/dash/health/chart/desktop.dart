import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TestLineChart extends StatelessWidget {
  const TestLineChart({ Key? key, required this.showHeartRate }) : super(key: key);

  final bool showHeartRate;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(drawHorizontalLine: false, drawVerticalLine: false),
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
        ),
        borderData: FlBorderData(show: false),
        minX: 1,
        maxX: 24,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            curveSmoothness: 0.45,
            isCurved: true,
            dotData: FlDotData(show: false),
            color: Colors.redAccent,
            spots: showHeartRate ? [
              FlSpot(1, 3),
              FlSpot(3, 2),
              FlSpot(5, 5),
              FlSpot(7, 2),
              FlSpot(9, 4),
              FlSpot(11, 3),
              FlSpot(12.5, 2),
              FlSpot(14, 4),
              FlSpot(16, 8),
              FlSpot(18, 7),
              FlSpot(20, 6),
              FlSpot(22, 4),
              FlSpot(24, 5),
            ] : [
              FlSpot(1, 2),
              FlSpot(3, 3),
              FlSpot(5, 4),
              FlSpot(7, 4),
              FlSpot(9, 3),
              FlSpot(11, 2),
              FlSpot(12.5, 2),
              FlSpot(14, 2),
              FlSpot(16, 4),
              FlSpot(18, 2),
              FlSpot(20, 3),
              FlSpot(22, 2),
              FlSpot(24, 3),
            ],
          ),
        ],
      ),
    );
  }
}
