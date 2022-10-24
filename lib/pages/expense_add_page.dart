import 'package:expence_tracker/custom_list/helperlist.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class ExpenseAddPage extends StatefulWidget {
  static const routeName = '/expenseaddpage';

  const ExpenseAddPage({Key? key}) : super(key: key);

  @override
  State<ExpenseAddPage> createState() => _ExpenseAddPage();
}

class _ExpenseAddPage extends State<ExpenseAddPage> {
  String dropdownValue = catagory.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor("#D0E0E8") ,
      appBar: AppBar(),
      body: Column(
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
                          width: 2
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
                    dropdownValue=value!;
                  });
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Cost",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:const BorderSide(color: Colors.green,width: 2)
                ),

              ),
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
                onPressed: () {},
                child: const Text("Submit", style: TextStyle(fontSize: 20),)),
          ),
        ],
      ),
    );
  }


}
