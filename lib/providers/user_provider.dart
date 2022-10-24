
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier{

  late UserModel  _userModel;
  UserModel get userModel => _userModel;


  Future<int>insertNewUser(UserModel userModel)=>
      Db_Helper.insertUser(userModel);

  Future<UserModel?>getUserByEmail(String email)=>
      Db_Helper.getUserByEmail(email);
}