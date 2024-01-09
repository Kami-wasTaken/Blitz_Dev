// ignore_for_file: prefer_const_constructors

import 'package:blitz/pages/dashboard/barchart/bar_data.dart';
import 'package:blitz/pages/dashboard/barchart/progress_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    BarData weeklyProgress = BarData(
      sunScore: 16.0,
      monScore: 50.0,
      tueScore: 20.0,
      wedScore: 83.0,
      thuScore: 39.0,
      friScore: 60.0,
      satScore: 20.0,
    );

    weeklyProgress.initializeBarData();
    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTiles,
                  reservedSize: 30))),
      barGroups: weeklyProgress.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Color.fromARGB(255, 185, 232, 172),
                    width: 20,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ))
          .toList(),
    ));
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle();
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;
    case 3:
      text = const Text('Thu', style: style);
      break;
    case 4:
      text = const Text('Fri', style: style);
      break;
    case 5:
      text = const Text('Sat', style: style);
      break;
    case 6:
      text = const Text('Sun', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
