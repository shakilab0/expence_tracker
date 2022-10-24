import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/pie_cart.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double total =0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:const Icon(Icons.add,size: 25,),
      ),
      backgroundColor:HexColor("#D0E0E8") ,
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text("Total Expences: \$ $total", style: const TextStyle(fontSize: 28, color: Colors.blue),),
          ),
          const SizedBox(height: 22,),
          Pie_chart(context),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              children: const [
                Text('Expences',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Spacer(),
                Text('Cost',style: TextStyle(color: Colors.blue,fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.train),
                  title: Text('Food'),
                  subtitle: Text('entries'),
                  trailing: Text('dolor'),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
