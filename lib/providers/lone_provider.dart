import 'package:expence_tracker/db/db_helper.dart';
import 'package:expence_tracker/models/lone_model.dart';
import 'package:flutter/material.dart';


class LoneProvider extends ChangeNotifier{

  List<LoneModel>loneList=[];
  late int total;


  Future<int>insertLone(LoneModel loneModel)=>
      DbHelper.insertLone(loneModel);

  void getAlllone()async{
    loneList=await DbHelper.getAllLone();
    notifyListeners();
  }
  int gettotallone() {
    int total=0;
    for (var element in loneList) {total=total+(element.amount as int);}
    return total;
  }



}
