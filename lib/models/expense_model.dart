
const String tableExp='exp_table';
const String tblExpColId='exp_id';
const String tblExpColCost='exp_cost';
const String tblExpColCatagory='exp_catagory';
const String tblExpColDatetime='exp_datetime';


class ExpenseModel{
  int? id;
  String catagory;
  int cost;
  String datetime;

  ExpenseModel({
    this.id,
    required this.catagory,
    required this.cost,
    required this.datetime,
  });

  Map<String,dynamic> toMap(){
    final map= <String,dynamic>{
      tblExpColCost: cost,
      tblExpColCatagory: catagory,
      tblExpColDatetime: datetime
    };
    if(id != null){
      map[tblExpColId] =id;
    }
    return map;
  }
  factory ExpenseModel.fromMap(Map<String,dynamic>map) => ExpenseModel(
    id : map[tblExpColId],
    catagory: map[tblExpColCatagory],
    cost: map[tblExpColCost],
    datetime: map[tblExpColDatetime]
  );

  @override
  String toString() {
    return 'ExpenseModel{id: $id, catagory: $catagory, cost: $cost, datetime: $datetime}';
  }
}