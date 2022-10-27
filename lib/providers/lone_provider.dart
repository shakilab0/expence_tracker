import 'package:expence_tracker/db/db_helper.dart';
import 'package:expence_tracker/models/lone_model.dart';
import 'package:flutter/material.dart';


class LoneProvider extends ChangeNotifier{

  List<LoneModel>expenceList=[];
  late int total;


  Future<int>insertLone(LoneModel loneModel)=>
      DbHelper.insertLone(loneModel);

  void getAlllone()async{
    expenceList=await DbHelper.getAllLone();
    notifyListeners();
  }
  int gettotallone() {
    int total=0;
    for (var element in expenceList) {total=total+(element.amount as int);}
    return total;
  }

  int getindivisuallone(String cat){
    getAlllone();
    int total=0;
    for (var element in expenceList.where((element) => element.catagory==cat)) {
      total=total+(element.amount as int);
    }
    return total;

  }


}
