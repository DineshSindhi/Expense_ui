import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ui/data/model/expense-model.dart';
import 'package:ui/data/model/user_model.dart';

class MyDataHelper{

  MyDataHelper._();
  static final MyDataHelper db=MyDataHelper._();
  static const String TABLE_NAME_USER='user';
  static const String TABLE_COLUMN_UID='id';
  static const String TABLE_COLUMN_NAME='name';
  static const String TABLE_COLUMN_UEMAIL='email';
  static const String TABLE_COLUMN_UPASS='pass';
  static const String TABLE_COLUMN_UMOBILE='mobile';

  static const String TABLE_NAME_EXPENSE='expense';
  static const String TABLE_COLUMN_EXPID='id';
  static const String TABLE_COLUMN_ETITLE='title';
  static const String TABLE_COLUMN_EDESC='desc';
  static const String TABLE_COLUMN_ETIME='time';
  static const String TABLE_COLUMN_EAMOUNT='amount';
  static const String TABLE_COLUMN_EBALANCE='balance';
  static const String TABLE_COLUMN_ETYPE='type';

  static const String TABLE_NAME_CAT='category';
  static const String TABLE_COLUMN_CATID='id';
  static const String TABLE_COLUMN_CATNAME='name';
  static const String TABLE_COLUMN_CATIMAGE='image';

  Database? myDb;

  Future<Database> getDb()async{
    if(myDb!=null){
      return myDb!;
    }
    else{
      myDb = await initDb();
      return myDb!;
    }
  }

  Future<Database> initDb()async{
    var root=await getApplicationDocumentsDirectory();
    var mainPath=join(root.path,'ExpenseDb');
    return await openDatabase(mainPath,version: 1,onCreate: (db,version){
      db.execute(' create table $TABLE_NAME_USER ( $TABLE_COLUMN_UID integer primary key autoincrement , $TABLE_COLUMN_UEMAIL text unique, $TABLE_COLUMN_UPASS text, $TABLE_COLUMN_UMOBILE text,$TABLE_COLUMN_NAME text )');
      db.execute('create table $TABLE_NAME_EXPENSE( $TABLE_COLUMN_EXPID integer primary key autoincrement,$TABLE_COLUMN_UID integer , $TABLE_COLUMN_ETITLE text,$TABLE_COLUMN_EDESC text,$TABLE_COLUMN_ETIME text,$TABLE_COLUMN_EBALANCE text,$TABLE_COLUMN_EAMOUNT text,$TABLE_COLUMN_ETYPE text)');
     /// db.execute(' create table $TABLE_NAME_CAT ( $TABLE_COLUMN_CATID integer primary key autoincrement,$TABLE_COLUMN_CATNAME text, )');
    });
  }
  ///[Query for User],
  Future<bool> addUser({required UserModel userModel})async{
    var db=await getDb();
    bool haveAccount= await checkEmailExist(email: userModel.email);
    bool check=false;
    if(!haveAccount){
      var rowEffect=await db.insert('$TABLE_NAME_USER',userModel.toMap());
      check= rowEffect>0;
    }
    return check;
  }

  Future<bool> checkEmailExist({required String email})async{
    var db=await getDb();
    var data =await db.query('$TABLE_NAME_USER',where: '$TABLE_COLUMN_UEMAIL= ? ',whereArgs: [email]);
    return data.isNotEmpty;
  }

  Future<bool>login(String email,String pass)async{
    var db=await getDb();
    var data= await db.query('$TABLE_NAME_USER',where: '$TABLE_COLUMN_UEMAIL = ? AND $TABLE_COLUMN_UPASS = ? ',whereArgs: [email,pass]);
    if(data.isNotEmpty){
      setUid(UserModel.fromMap(data[0]).uid);
    }
    return data.isNotEmpty;
  }

  Future<int>getUd()async{
    var pref=await SharedPreferences.getInstance();
   return  pref.getInt('UID')!;
  }
  void setUid( int Uid)async{
    var pref=await SharedPreferences.getInstance();
    pref.setInt('UID', Uid);
  }


  ///[Query for Expense],
  void addExpense({required ExpenseModel expenseModel})async{
    var db=await getDb();
    var uid=await getUd();
    expenseModel.uid=uid;
    db.insert('$TABLE_NAME_EXPENSE',expenseModel.toMap() );
  }

  Future<List<ExpenseModel>> fecExpense()async{
    var db=await getDb();

    var uid=await getUd();

    var data =await db.query('$TABLE_NAME_EXPENSE', where: '$TABLE_COLUMN_UID = ?',whereArgs: ['$uid']);
    List<ExpenseModel>mData=[];
    for(Map<String,dynamic>eachUser in data){
      var each=ExpenseModel.fromMap(eachUser);
      mData.add(each);
    }
    return mData;
  }

  void updateExpense(ExpenseModel upExpenseModel)async{
    var db=await getDb();
    db.update('$TABLE_NAME_EXPENSE',upExpenseModel.toMap(), where: '$TABLE_COLUMN_EXPID= ? ',whereArgs: ['${upExpenseModel.id}']);
  }
  void deleteExpense(int id)async{
    var db=await getDb();
    db.delete('$TABLE_NAME_EXPENSE', where: '$TABLE_COLUMN_EXPID= ? ',whereArgs: [id]);
  }


}