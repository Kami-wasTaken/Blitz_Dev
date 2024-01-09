import 'package:blitz/pages/dashboard/barchart/individual_bar.dart';

class BarData {
  final double sunScore;
  final double monScore;
  final double tueScore;
  final double wedScore;
  final double thuScore;
  final double friScore;
  final double satScore;

  BarData({
    required this.sunScore,
    required this.monScore,
    required this.tueScore,
    required this.wedScore,
    required this.thuScore,
    required this.friScore,
    required this.satScore,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunScore),
      IndividualBar(x: 1, y: monScore),
      IndividualBar(x: 2, y: tueScore),
      IndividualBar(x: 3, y: wedScore),
      IndividualBar(x: 4, y: thuScore),
      IndividualBar(x: 5, y: friScore),
      IndividualBar(x: 6, y: satScore),
    ];
  }
}
