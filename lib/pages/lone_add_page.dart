import 'package:expence_tracker/custom_list/helper_function&list.dart';
import 'package:expence_tracker/models/expense_model.dart';
import 'package:expence_tracker/models/lone_model.dart';
import 'package:expence_tracker/providers/expence_provider.dart';
import 'package:expence_tracker/providers/lone_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';



class LoneAddPage extends StatefulWidget {
  static const routeName = '/loneaddpage';

  const LoneAddPage({Key? key}) : super(key: key);

  @override
  State<LoneAddPage> createState() => _LoneAddPage();
}

class _LoneAddPage extends State<LoneAddPage> {

  final costContoller = TextEditingController();



  @override
  void dispose() {
    costContoller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  final _formKey=GlobalKey<FormState>();
  String? dropdownValue ;
  DateTime? addDate;
  int? id;
  int? amount;
  DateTime? payDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor("#D0E0E8") ,
      appBar: AppBar(title: Text('Lone Add'),),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButtonFormField<String>(
                  decoration:InputDecoration(
                      label:const Text("Select Catagory"),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      )
                  ),
                  items: catagory.map((e) => DropdownMenuItem(value:e,child:Text(e!))).toList(),
                  value: dropdownValue,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please select catagory';
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      dropdownValue=value;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: costContoller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:const BorderSide(color: Colors.green,width: 2)
                  ),

                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please input your cost';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: selectDate,
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('Select Release Date'),
                  ),
                  Text(payDate == null
                      ? 'No date chosen'
                      : getFormattedDate(payDate!, 'dd/MM/yyyy'))
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  child: const Text("Submit", style: TextStyle(fontSize: 20),),
                  onPressed:(){
                    addLone();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addLone() {
    final provider=Provider.of<LoneProvider>(context,listen: false);
    if(_formKey.currentState!.validate()){
      final addDate=DateTime.now();
      int cost =int.parse(costContoller.text);

      final loneModel = LoneModel(
        catagory: dropdownValue!, amount: cost, takendate: getFormattedDate(DateTime.now(), "dd/MM/yyyy HH:mm:ss a"), paydate: getFormattedDate(addDate, "dd/MM/yyyy HH:mm:ss a"),
      );

      provider.insertLone(loneModel)
          .then((value) {
        provider.getAlllone();
        Navigator.pop(context);
      })
          .catchError((error){
        print("data not insert");
      });

    }
  }

  void selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        payDate = selectedDate;
      });
    }
  }
}
