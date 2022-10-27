import 'package:expence_tracker/providers/multi_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../providers/expence_provider.dart';


class EducationExpence extends StatefulWidget {
  const EducationExpence({Key? key}) : super(key: key);

  @override
  State<EducationExpence> createState() => _EducationExpenceState();
}

class _EducationExpenceState extends State<EducationExpence> {

  int total=0;
  String cat='';
  @override
  void didChangeDependencies() {
    Provider.of<MultiScreenProvider>(context,listen: false)
        .getEducationExpence("Education Cost");
    total=Provider.of<ExpenceProvider>(context,listen: true)
        .getindivisualcost(cat);

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
                      itemCount:provider.educationExpenceList.length,
                      itemBuilder: (context, index) {
                        final expence = provider.educationExpenceList[index];
                        cat=provider.educationExpenceList[index].catagory;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
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
                            ),
                          ],
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
                      children:[Text('Total education cost: ''$total',style: const TextStyle(fontSize: 20,color: Colors.green),)],
                    ),
                  ),
                ),
              
            ],
          ),
    );
  }
}
