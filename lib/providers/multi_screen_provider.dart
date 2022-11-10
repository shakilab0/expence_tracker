import 'package:expence_tracker/db/db_helper.dart';
import 'package:expence_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:expence_tracker/providers/expence_provider.dart';

class MultiScreenProvider extends ChangeNotifier{
  late int total;

  List<ExpenseModel>foodExpenceList=[];

  void getFoodExpence(String catagory)async{
    foodExpenceList=await DbHelper.getFoodExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>travelExpenceList=[];

  void getTravelsExpence(String catagory)async{
    travelExpenceList=await DbHelper.getTravelsExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>educationExpenceList=[];

  void getEducationExpence(String catagory)async{
    educationExpenceList=await DbHelper.getEducationExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>medicalExpenceList=[];

  void getMedicalExpence(String catagory)async{
    medicalExpenceList=await DbHelper.getMedicalExpence(catagory);
    notifyListeners();
  }


  List<ExpenseModel>gfCostExpenceList=[];

  void getGfCostExpence(String catagory)async{
    gfCostExpenceList=await DbHelper.getGfCostExpence(catagory);
    notifyListeners();
  }






}