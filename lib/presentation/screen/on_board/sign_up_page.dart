import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/data/model/user_model.dart';
import 'package:ui/data/repository/local/local_database.dart';
import 'package:ui/domain/ui_helper.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/bloc.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/events.dart';
import 'package:ui/presentation/screen/on_board/login_page.dart';

import '../home/bloc_for_app/bloc_for_on_board/states.dart';
class SignPage extends StatelessWidget {
  
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var nameController=TextEditingController();
  var mobController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create Account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400)),
            mySizeBox(),
          myTextFiled(controllerName: nameController, label: 'Name',hint: 'Enter your Name'),
            mySizeBox(),
            myTextFiled(controllerName: mobController, label: 'Mobile Number',hint: 'Enter your Mobile Number',keyboardType: TextInputType.number,),
            mySizeBox(),
          myTextFiled(controllerName: emailController, label: 'Email',hint: 'Enter your Email',suffixText: '@gmail.com',),
            mySizeBox(),
          myTextFiled(controllerName: passController, label: 'Password',hint: 'Enter your Password',suffixIcon: Icon(Icons.visibility_off),obscureText: true),
            mySizeBox(),
          BlocListener<UserBloc,UserState>(
            listener: (BuildContext context, state) {
              if(state is LoadedS){
                Navigator.pop(context);
              }else if(state is ErrorS){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg),backgroundColor: Colors.blue,
                  action: SnackBarAction(label: 'Login Page', onPressed: () {
                    Navigator.pop(context);
                  },),));
              }
            },
            child: ElevatedButton(onPressed: () async {

               context.read<UserBloc>().add(AddUserEvent(allUser: UserModel(
                 email: '${emailController.text.toString()}@gmail.com',
                 pass: passController.text.toString(),
                 mobile: mobController.text.toString(),
                 uid: 0,
                 name: nameController.text)));

            }, child: Text('Sing Up',style: TextStyle(fontSize: 20))),
          ),
            mySizeBox(),
            InkWell(onTap: (){
              Navigator.pop(context);
            },
                child: Text('Already have an Account,Login now',style: TextStyle(fontSize: 22,color: Colors.purple.shade600),)),
        ],
        ),
      ),
    );
  }
}
// var db=MyDataHelper.db;
// var check = await db.addUser(userModel: UserModel(
//   uid: 0,
//     name: nameController.text,
//     email: '${emailController.text.toString()}@gmail.com',
//     pass: passController.text.toString(),
//     mobile: mobController.text.toString()));
// if(check){
//   Navigator.pop(context);
// }else{
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Already Exist'),backgroundColor: Colors.blue,
//     action: SnackBarAction(label: 'Login Page', onPressed: () {
//       Navigator.pop(context);
//     },),));
// }