
import 'package:expence_tracker/models/loan_model.dart';

import '../models/expense_model.dart';
import '../models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DbHelper {
  static const String createTableExp = ''' create table $tableExp(
  $tblExpColId integer primary key autoincrement,
  $tblExpColCatagory text,
  $tblExpColCost integer,
  $tblExpColDatetime text)''';

  static const String createTableLoan = ''' create table $tableLoan(
  $tblLoanColId integer primary key autoincrement,
  $tblLoanColLendersName text,
  $tblLoanColLoanAmount integer,
  $tblLoanColLoanDate text,
  $tblLoanColLastDate text)''';

  static const String createTableUser=''' create table $tableUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColemail text,
  $tblUserColPass text)''';

  static Future<Database> open()async{
    final rootPath=await getDatabasesPath();
    final dbPath=Path.join(rootPath,'expense_db');
    return openDatabase(dbPath,version: 1,onCreate: (db,version)async{
      await db.execute(createTableUser);
      await db.execute(createTableExp);
      await db.execute(createTableLoan);
    });
  }

static Future <int> insertUser(UserModel userModel)async{
    final db=await open();
    return db.insert(tableUser, userModel.toMap());
}

static Future<UserModel>getUserByEmail(String email)async {
    final db= await open();
    final mapList=await db.query(tableUser,where: '$tblUserColemail = ? ',whereArgs: [email]);
    return  UserModel.fromMap(mapList.first);
}

  static Future <int> insertExpence(ExpenseModel expenseModel)async{
    final db=await open();
    return db.insert(tableExp, expenseModel.toMap());
  }

  static Future<List<ExpenseModel>>getAllExpence()async{
    final db=await open();
    final maplist=await db.query(tableExp);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }

  static Future<int>insertLoan(LoanModel loanModel)async{
    final db=await open();
    return db.insert(tableLoan, loanModel.toMap());
  }

  static Future<List<LoanModel>>getAllLoan()async{
    final db=await open();
    final maplist = await db.query(tableLoan);
    return List.generate(maplist.length, (index) =>
        LoanModel.formMap(maplist[index]),
    );
  }



//Multi Screen query Start now:

  static Future<List<ExpenseModel>>getFoodExpence(String catagory)async{
    final db=await open();
    final maplist=await db.query(tableExp,where: '$tblExpColCatagory = ? ',whereArgs: [catagory]);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }

  static Future<List<ExpenseModel>>getTravelsExpence(String catagory)async{
    final db=await open();
    final maplist=await db.query(tableExp,where: '$tblExpColCatagory = ? ',whereArgs: [catagory]);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }

  static Future<List<ExpenseModel>>getEducationExpence(String catagory)async{
    final db=await open();
    final maplist=await db.query(tableExp,where: '$tblExpColCatagory = ? ',whereArgs: [catagory]);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }

  static Future<List<ExpenseModel>>getMedicalExpence(String catagory)async{
    final db=await open();
    final maplist=await db.query(tableExp,where: '$tblExpColCatagory = ? ',whereArgs: [catagory]);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }

  static Future<List<ExpenseModel>>getGfCostExpence(String catagory)async{
    final db=await open();
    final maplist=await db.query(tableExp,where: '$tblExpColCatagory = ? ',whereArgs: [catagory]);
    return List.generate(maplist.length, (index) =>
        ExpenseModel.fromMap(maplist[index]),
    );
  }



}



