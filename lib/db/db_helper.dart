import 'package:expence_tracker/custom_list/helperlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/expense_model.dart';
import '../models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class Db_Helper {
  static const String createTableExpen = '''create table $tableExp(
    $tblExpColId integer primary key autoincrement,
    $tblExpColCatagory text,
    $tblExpColCost integer,
    $tblExpColDatetime text)''';

  static const String createTableUser = '''create table $tableUser(
    $tblUserColId integer primary key autoincrement,
    $tblUserColemail text,
    $tblUserColPass text)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'exp_db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(createTableExpen);
      await db.execute(createTableUser);
    });
  }

  static Future<int> insertUser(UserModel userModel) async {
    final db = await open();
    return db.insert(tableUser, userModel.toMap());
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(tableUser,where: '$tblUserColemail = ? ',whereArgs: [email]);
    if (mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }
}

Future<bool> setUserId(int id) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(userId, id);
}

Future<bool> setLoginStatus(bool status) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setBool(isLoggedId, status);
}

Future<bool> getLoginStatus() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getBool(isLoggedId) ?? false;
}

Future<int> getUserId() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(userId) ?? 0;
}
