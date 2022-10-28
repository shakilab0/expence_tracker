
import 'package:expence_tracker/pages/expense_add_page.dart';
import 'package:expence_tracker/pages/lone_add_page.dart';
import 'package:expence_tracker/pages/multi_screen_pages.dart';
import 'package:expence_tracker/providers/expence_provider.dart';
import 'package:expence_tracker/providers/lone_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../utils/pie_cart.dart';

class LoneDetailsPage extends StatefulWidget {
  static const String routeName = "/lonedetailsepage";

  const LoneDetailsPage({Key? key}) : super(key: key);

  @override
  State<LoneDetailsPage> createState() => _LoneDetailsPage();
}

class _LoneDetailsPage extends State<LoneDetailsPage> {

  @override
  void didChangeDependencies() {
    Provider.of<LoneProvider>(context,listen: false).getAlllone();
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   onPressed: (){
      //     Navigator.pushNamed(context, ExpenseAddPage.routeName);
      //   },
      //   child:const Icon(Icons.add,size: 30,),
      // ),
      backgroundColor:HexColor("#D0E0E8") ,
      appBar: AppBar(
        title: const Text("Lone Details"),
      ),
      body: Consumer<LoneProvider>(
        builder:(context,provider,child)=> Column(
          children: [
            Container(
              color:HexColor("#D0E0E8") ,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Total Lone: \$ ${provider.gettotallone()}", style: const TextStyle(fontSize: 28, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 22,),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: const [
                        Text('Lone Date',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text('Amount',style: TextStyle(color: Colors.red,fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child:ListView.builder(
                // //physics: ScrollableScrollPhysics(),
                // shrinkWrap: false,
                itemCount:provider.loneList.length,
                itemBuilder: (context, index) {
                  final lone = provider.loneList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 7),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text('${lone.id}. Lone Take Date: ${lone.takendate}',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                      subtitle: Text('Lone Pay Date: ${lone.paydate}'),
                      trailing: Text("\$ ${lone.amount.toString()}",style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      tileColor: Colors.green,

                    ),
                  );
                },

              ),
            ),

         ],
        ),
      ),
    );
  }


}
