import 'package:expence_tracker/models/loan_model.dart';
import 'package:expence_tracker/providers/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_list/helper_function&list.dart';
import '../utils/notifications_util.dart';

class LoanAdd extends StatefulWidget {
  static const  String routeName="/loanadd";
  const LoanAdd({Key? key}) : super(key: key);

  @override
  State<LoanAdd> createState() => _LoanAddState();
}

class _LoanAddState extends State<LoanAdd> {
  final loan_name_controller=TextEditingController();
  final loan_controller=TextEditingController();

  @override
  void dispose() {
    loan_controller.dispose();
    loan_name_controller.dispose();
    super.dispose();
  }

  final _formKey=GlobalKey<FormState>();
  DateTime?loan_date;
  DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Add"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("Lender's Name : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: loan_name_controller,
                decoration: InputDecoration(
                  hintText: "Lender's Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.green
                    )
                  )
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please select catagory';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10,),
              const Text("Loan Amount : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: loan_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.green
                        )
                    )
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please select catagory';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10,),
              const Text("Last Date : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: (){
                        selectDate();
                      },
                      icon:const Icon(Icons.calendar_month,size: 25,),
                      label:const Text("Selected Last Date : ",style: TextStyle(fontSize: 18,),),
                  ),
                  Text(lastDate==null ? "No Date chosen":getFormattedDate(lastDate!,"dd/MM/yyyy"),style:TextStyle(fontSize: 18,color: Colors.green),)
                ],
              ),


              const SizedBox(height: 20,),
              ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  onPressed: (){
                    addLoan();
                  },
                  child:const Padding(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child:  Text("Submit"),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void selectDate() async{
    final selectedDate=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year+50),
    );
    if(selectedDate!=null){
      setState(() {
        lastDate=selectedDate;
      });
    }
  }

  void addLoan() {
    final provider=Provider.of<LoanProvider>(context,listen: false);
    if(_formKey.currentState!.validate()){
      if(lastDate==null){
        showMsg(context, "Please select date");
        return;
      }
      final loanDate=DateTime.now();
      int loan =int.parse(loan_controller.text);
      final loanModel=LoanModel(
          lendersName:loan_name_controller.text,
          loan: loan,
          loanDate: getFormattedDate(loanDate, "dd/MM/yyyy HH:mm a"),
          lastDate:lastDate!.add(Duration(hours: loanDate.hour, minutes:loanDate.minute+1 )).toLocal().toString(),
      );

      provider.insertLoan(loanModel)
          .then((value) {
        provider.getAllLoan();
        Navigator.pop(context);
        var lone=Provider.of<LoanProvider>(context,listen: false).count+1;
        NotificationService().scheduleNotification(lone, 'Pay lone quickly', 'Time Up: ${loanModel.loan}',lastDate!.add(Duration(hours: DateTime.now().hour, minutes:DateTime.now().minute+1,seconds: DateTime.now().second )).toLocal(), loanModel.loanDate);

      })
          .catchError((error){
        print("data not insert");
      });




    }
  }


}
