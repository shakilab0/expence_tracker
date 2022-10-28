import 'package:expence_tracker/providers/multi_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../providers/expence_provider.dart';


class GfCostExpence extends StatefulWidget {
  const GfCostExpence({Key? key}) : super(key: key);

  @override
  State<GfCostExpence> createState() => _GfCostExpenceState();
}

class _GfCostExpenceState extends State<GfCostExpence> {

  String cat='Gf Cost';

  @override
  void didChangeDependencies() {
    Provider.of<MultiScreenProvider>(context,listen: false).getExpence("Gf Cost");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:HexColor("#D0E0E8") ,
        body:Consumer<MultiScreenProvider>(
          builder:(context,provider,child)=> Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.75,
                  child: ListView.builder(
                    itemCount:provider.ExpenceList.length,
                    itemBuilder: (context, index) {
                      final expence = provider.ExpenceList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 7),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(expence.catagory,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: Text(expence.datetime),
                          trailing: Text("\$ ${expence.cost.toString()}",style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          tileColor: Colors.green,

                        ),
                      );
                    },

                  )
              ),

              Expanded(
                child: Container(
                  color:HexColor("#D0E0E8"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[Text('Total GF cost: ''${provider.getindivisualcost(cat)}',style: const TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),)],
                  ),
                ),
              ),
            ],
          ),)
    );
  }
}
