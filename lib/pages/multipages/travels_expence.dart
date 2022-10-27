import 'package:expence_tracker/providers/multi_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../providers/expence_provider.dart';


class TravelsExpence extends StatefulWidget {
  const TravelsExpence({Key? key}) : super(key: key);

  @override
  State<TravelsExpence> createState() => _TravelsExpenceState();
}

class _TravelsExpenceState extends State<TravelsExpence> {

  int total=0;
  String cat='';

  @override
  void didChangeDependencies() {
    Provider.of<MultiScreenProvider>(context,listen: false).getTravelsExpence("Travels Cost");
    total=Provider.of<ExpenceProvider>(context,listen: true).getindivisualcost(cat);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor("#D0E0E8") ,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.70,
            child: Consumer<MultiScreenProvider>(
                builder:(context,provider,child)=>ListView.builder(
                  itemCount:provider.travelExpenceList.length,
                  itemBuilder: (context, index) {
                    final expence = provider.travelExpenceList[index];
                    cat=provider.travelExpenceList[index].catagory;
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
          ),
          Expanded(
            child: Container(
              color:HexColor("#D0E0E8"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[Text('Total Travels cost: ''$total',style: const TextStyle(fontSize: 20,color: Colors.green),)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}