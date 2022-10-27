
import 'package:expence_tracker/pages/expense_add_page.dart';
import 'package:expence_tracker/pages/home_page.dart';
import 'package:expence_tracker/pages/launcher_page.dart';
import 'package:expence_tracker/pages/login_page.dart';
import 'package:expence_tracker/pages/multi_screen_pages.dart';
import 'package:expence_tracker/providers/expence_provider.dart';
import 'package:expence_tracker/providers/lone_provider.dart';
import 'package:expence_tracker/providers/multi_screen_provider.dart';
import 'package:expence_tracker/providers/user_provider.dart';
import 'pages/lone_add_page.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>ExpenceProvider()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
      ChangeNotifierProvider(create: (context)=>MultiScreenProvider()),
      ChangeNotifierProvider(create: (context)=>LoneProvider()),

    ],
      child: const MyApp()),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: HomeScreen(),


      initialRoute: LauncherPage.routeName,
      routes: {
        LoginPage.routeName:(context)=>const LoginPage(),
        HomePage.routeName:(context)=>const HomePage(),
        ExpenseAddPage.routeName:(context)=>const ExpenseAddPage(),
        LoneAddPage.routeName:(context)=>const LoneAddPage(),
        LauncherPage.routeName:(context)=>const LauncherPage(),
        MultiScreenPages.routeName:(context)=>const MultiScreenPages(),
      },

    );
  }
}
