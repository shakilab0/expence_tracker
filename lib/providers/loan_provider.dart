import 'package:expence_tracker/db/db_helper.dart';
import 'package:expence_tracker/models/loan_model.dart';
import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier{

  List<LoanModel>loanList=[];
  late int totalLoan,count;

Future<int>insertLoan(LoanModel loanModel)=>
    DbHelper.insertLoan(loanModel);

  void getAllLoan()async{
    loanList=await DbHelper.getAllLoan();
    count=loanList.length;
    notifyListeners();
  }

  int gettotalLoan() {
    int totalloan = 0;
    for (var element in loanList) {
      totalloan = totalloan + element.loan;
    }
    return totalloan;
  }


}