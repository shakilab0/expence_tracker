import 'package:expence_tracker/db/db_helper.dart';
import 'package:expence_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';


class MultiScreenProvider extends ChangeNotifier{


  List<ExpenseModel>ExpenceList=[];
  int total=0;

  void getExpence(String catagory)async{
    ExpenceList=await DbHelper.getFoodExpence(catagory);
    notifyListeners();

  }
  int getindivisualcost(String cat){
    int total=0;
    for (var element in ExpenceList) {
      total=total+element.cost;
    }
    return total ?? 0;

  }




}