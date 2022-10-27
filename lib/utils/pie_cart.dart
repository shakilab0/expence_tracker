import 'package:expence_tracker/providers/expence_provider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:provider/provider.dart';


Map<String, double> dataMap = {
  "Food Cost": 7,
  "Travels Cost": 3,
  "Medical Cost": 2,
  "Education Cost": 2,
  "GF Cost":7,
};


final gradientList = <List<Color>>[
  [
    const Color.fromRGBO(223, 250, 92, 1),
    const Color.fromRGBO(129, 250, 112, 1),
  ],
  [
    const Color.fromRGBO(129, 182, 205, 1),
    const Color.fromRGBO(91, 253, 199, 1),
  ],
  [
    const Color.fromRGBO(175, 63, 62, 1.0),
    const Color.fromRGBO(254, 154, 92, 1),
  ],
  [
    const Color.fromRGBO(95, 87, 87, 1.0),
    const Color.fromRGBO(95, 87, 87, 1),
  ]
];

 Pie_chart(BuildContext context) {
  return PieChart(
    dataMap: dataMap,

    animationDuration: const Duration(milliseconds: 800),
    chartLegendSpacing: 10,
    chartRadius: MediaQuery.of(context).size.width / 2.2,
    gradientList: gradientList,
    emptyColorGradient: const [
      Color(0xff6c5ce7),
      Colors.blue,
    ],
    initialAngleInDegree: 0,
    chartType: ChartType.disc,
    ringStrokeWidth: 50,
    //  centerText: "HYBRID",
    legendOptions: const LegendOptions(
      showLegendsInRow: false,
      legendPosition: LegendPosition.left,
      showLegends: true,
      legendShape: BoxShape.circle,
      legendTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    chartValuesOptions: const ChartValuesOptions(
      chartValueStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      showChartValueBackground: false,
      showChartValues: true,
      showChartValuesInPercentage: false,
      showChartValuesOutside: false,
      decimalPlaces: 1,
    ),
    // gradientList: ---To add gradient colors---
    // emptyColorGradient: ---Empty Color gradient---
  );
}
