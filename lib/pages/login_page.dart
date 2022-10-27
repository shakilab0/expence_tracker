
import 'package:expence_tracker/custom_list/helper_function&list.dart';
import 'package:expence_tracker/pages/home_page.dart';
import 'package:expence_tracker/pages/launcher_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:hexcolor/hexcolor.dart';
import '../db/db_helper.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName="/loginpage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String errMsg = "";
  bool isLogin=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D0E0E8"),
      appBar: AppBar(
        title: const Text("LoginPage", style: TextStyle(fontSize: 28),),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 250,
            child: RiveAnimation.asset(
              "images/animated_login_screen.riv", fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Text("Email :",
                        style: TextStyle(fontSize: 23, color: Colors.green),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Text("Password :",
                        style: TextStyle(fontSize: 23, color: Colors.green),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            child: const Text(
                              "LogIn", style: TextStyle(fontSize: 20),),
                            onPressed: () {
                              isLogin=true;
                              _loginState();
                            },
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            child: const Text(
                              "Register", style: TextStyle(fontSize: 20),),
                            onPressed: () {
                              isLogin=false;
                              _loginState();
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(
                      height: 10,
                    ),
                    Center(child: Text(errMsg, style: const TextStyle(fontSize: 20, color: Colors.red),)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  void _loginState() async {
    final provider=Provider.of<UserProvider>(context,listen: false);
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passController.text;
      if(isLogin){
        provider.getUserByEmail(email)
            .then((user){
              if(user.password==password){
                setLoginStatus(true).then((value){
                  Navigator.pushReplacementNamed(context, LauncherPage.routeName);
                });
              }else{
                _setErrorMsg("wrong password");
              }

        })
            .catchError((error){
          _setErrorMsg("Din not found your Email please try again or registration");

        });

      }else{
        provider.getUserByEmail(email)
            .then((user){
            _setErrorMsg("allready have a account ");
        })
            .catchError((insetuser){
              final userModel=UserModel(email: email, password: password);
              provider.insertUser(userModel)
                  .then((rowId){
                    setLoginStatus(true).then((value) {
                      userModel.id=rowId;
                      //provider.userModel=userModel;
                      Navigator.pushReplacementNamed(context, LauncherPage.routeName);
                    });
              })
                  .catchError((onError){
                    print("database error");
              });
        });
      }


    }
  }

  void _setErrorMsg(String s) {
    setState(() {
      errMsg = s;
    });
  }


}
