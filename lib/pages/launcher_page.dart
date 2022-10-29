import 'package:expence_tracker/pages/home_page.dart';
import 'package:expence_tracker/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName="/launcherpage";
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
     redirectUser();
    super.initState();
  }

  Future<void> redirectUser() async {
    if(await getLoginStatus()){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }else{
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}



Future<bool>setLoginStatus(bool status)async{
  final pref=await SharedPreferences.getInstance();
  return pref.setBool("login", status);
}

Future<bool>getLoginStatus()async{
  final pref=await SharedPreferences.getInstance();
  return pref.getBool("login")??false;
}
