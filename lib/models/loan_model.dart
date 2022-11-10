
const String tableLoan='loan_table';
const String tblLoanColId='loan_id';
const String tblLoanColLendersName='loan_lenders_Name';
const String tblLoanColLoanAmount='loan_amount';
const String tblLoanColLoanDate='loan_date';
const String tblLoanColLastDate='loan_lastDate';


class LoanModel {
  int? id;
  String lendersName;
  int loan;
  String loanDate;
  String lastDate;

  LoanModel({
    this.id,
    required this.lendersName,
    required this.loan,
    required this.loanDate,
    required this.lastDate,
  });

  Map<String,dynamic>toMap(){
    final map=<String,dynamic>{
     tblLoanColLendersName:lendersName,
     tblLoanColLoanAmount:loan,
    tblLoanColLoanDate:loanDate,
    tblLoanColLastDate:lastDate,
    };
    if(id!=null){
      map[tblLoanColId]=id;
    }
    return map;
  }
  factory LoanModel.formMap(Map<String,dynamic>map)=>LoanModel(
      id: map[tblLoanColId],
      lendersName:  map[tblLoanColLendersName],
      loan:  map[tblLoanColLoanAmount],
      loanDate:  map[tblLoanColLoanDate],
      lastDate:  map[tblLoanColLastDate],
  );


}