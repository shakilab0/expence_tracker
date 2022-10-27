
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier{

  late UserModel  _userModel;

  set userModel(UserModel value) {
    _userModel = value;
  }

  UserModel get userModel => _userModel;

Future<int>insertUser(UserModel userModel)=>
    DbHelper.insertUser(userModel);

Future<UserModel>getUserByEmail(String email){
  return DbHelper.getUserByEmail(email);

}



}