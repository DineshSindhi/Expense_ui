

import 'package:ui/data/repository/local/local_database.dart';

class UserModel{
  int uid;
  String email;
  String pass;
  String mobile;
  String name;
  UserModel({required this.email,required this.pass,required this.mobile,required this.uid,required this.name});

  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
      name: map[MyDataHelper.TABLE_COLUMN_NAME],
      uid: map[MyDataHelper.TABLE_COLUMN_UID],
        email: map[MyDataHelper.TABLE_COLUMN_UEMAIL],
        pass: map[MyDataHelper.TABLE_COLUMN_UPASS],
        mobile: map[MyDataHelper.TABLE_COLUMN_UMOBILE]);
  }

  Map<String,dynamic>toMap(){
   return {
    MyDataHelper.TABLE_COLUMN_UEMAIL: email,
    MyDataHelper.TABLE_COLUMN_NAME: name,
    MyDataHelper.TABLE_COLUMN_UPASS: pass,
    MyDataHelper.TABLE_COLUMN_UMOBILE: mobile,
  };
}
}