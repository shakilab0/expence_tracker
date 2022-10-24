import 'package:expence_tracker/pages/expense_add_page.dart';
import 'package:expence_tracker/pages/home_page.dart';
import 'package:expence_tracker/pages/login_page.dart';
import 'package:expence_tracker/providers/provider_class.dart';
import 'package:expence_tracker/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>ProviderClass()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
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


      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName:(context)=>const LoginPage(),
        HomePage.routeName:(context)=>const HomePage(),
        ExpenseAddPage.routeName:(context)=>const ExpenseAddPage(),
      },

    );
  }
}
