const String tableLone='lone_table';
const String tblLoneCatagory ='lone_catagory';
const String tblLoneId ='lone_id';
const String tblLoneAmount='lone_amount';
const String tblLoneTakeDate='taken_date';
const String tblLonePayDate='pay_date';



class LoneModel{
  int? id;
  int? amount;
  String? catagory;
  String? takendate;
  String? paydate;


  LoneModel({
    this.id,
    required this.amount,
    required this.catagory,
    required this.takendate,
    required this.paydate,
  });

  Map<String,dynamic>toMap(){
    final map=<String,dynamic>{
      tblLoneCatagory:catagory,
      tblLoneAmount:amount,
      tblLonePayDate:paydate,
      tblLoneTakeDate:takendate,
    };
    if(id != null){
      map[tblLoneId] =id;
    }
    return map;
  }

  factory LoneModel.fromMap(Map<String,dynamic>map)=>
      LoneModel(
          id: map[tblLoneId],
          amount: map[tblLoneAmount], catagory: map[tblLoneCatagory], takendate: map[tblLoneTakeDate], paydate: map[tblLonePayDate]
      );

  @override
  String toString() {
    return 'LoneModel{id:$id, ammount:$amount, catagory:$catagory, takendate:$takendate, paydate:$paydate}';

  }

}