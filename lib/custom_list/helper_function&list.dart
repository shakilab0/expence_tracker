
import 'package:expence_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/expence_provider.dart';

List<String> catagory =['Food Cost','Travels Cost','Medical Cost','Education Cost','Gf Cost' ];

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}


//shakil new update

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));


ListTile ShowListTile(ExpenseModel expence) {
  return ListTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    title: Text(expence.catagory,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
    subtitle: Text(expence.datetime),
    trailing: Text("\$ ${expence.cost.toString()}",style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    tileColor: Colors.green,

  );
}






