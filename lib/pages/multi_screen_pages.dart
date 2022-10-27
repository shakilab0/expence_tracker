import 'package:expence_tracker/pages/multipages/food_expence.dart';
import 'package:expence_tracker/pages/multipages/gf_cost_expence.dart';
import 'package:expence_tracker/pages/multipages/medical_expence.dart';
import 'package:expence_tracker/pages/multipages/travels_expence.dart';
import 'package:expence_tracker/pages/multipages/education_expence.dart';
import 'package:flutter/material.dart';


class MultiScreenPages extends StatefulWidget {
  static const routeName="/multiscreen";
  const MultiScreenPages({Key? key}) : super(key: key);

  @override
  State<MultiScreenPages> createState() => _MultiScreenPages();
}

class _MultiScreenPages extends State<MultiScreenPages>with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller=TabController(length: 5, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expence Catagory"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: const [
            Tab(text: "Food",),
            Tab(text: "Travels",),
            Tab(text: "Education",),
            Tab(text: "Medical",),
            Tab(text: "Gf cost",),

          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          FoodExpence(),
          TravelsExpence(),
          EducationExpence(),
          MedicalExpence(),
          GfCostExpence(),
        ],
      ),
    );
  }
}
