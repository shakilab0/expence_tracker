import 'package:expence_tracker/custom_list/helper_function&list.dart';
import 'package:expence_tracker/providers/expence_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

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
    const Color.fromRGBO(255, 87, 187, 1.0),
    const Color.fromRGBO(20, 155, 255, 1),
  ]
];
double call(String a,ExpenceProvider b){
  int x,m;
  double persent;
  x=b.getindivisualcost(a);
  m=b.gettotalexpence();
  if(m==0){ persent= 0.00;}
  else{persent=(x*100)/m*1.00;}

  return persent;


}

 Pie_chart(BuildContext context,ExpenceProvider provider) {
  return PieChart(
    dataMap: {
      "Food Cost": call(catagory[0], provider),
      "Travels Cost": call(catagory[1], provider),
      "Medical Cost": call(catagory[2], provider),
      "Education Cost": call(catagory[3], provider),
      "GF Cost":call(catagory[4], provider),
    },

    animationDuration: const Duration(milliseconds: 800),
    chartLegendSpacing: 20,
    chartRadius: MediaQuery.of(context).size.width / 2.1,
    gradientList: gradientList,
    emptyColorGradient: [
      const Color(0xff6c5ce7),
      HexColor('006404FF'),
    ],
    initialAngleInDegree: 0,
    chartType: ChartType.disc,
    ringStrokeWidth: 55,
    //  centerText: "HYBRID",
    legendOptions: const LegendOptions(
      showLegendsInRow: false,
      legendPosition: LegendPosition.left,
      showLegends: true,
      legendShape: BoxShape.rectangle,
      legendTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    chartValuesOptions: const ChartValuesOptions(
      chartValueStyle: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      showChartValueBackground: false,
      showChartValues: true,
      showChartValuesInPercentage: true,
      showChartValuesOutside: false,
      decimalPlaces: 2,
    ),
    // gradientList: ---To add gradient colors---
    // emptyColorGradient: ---Empty Color gradient---
  );
}
