import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/data/repository/local/local_database.dart';
import 'package:ui/domain/ui_helper.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/events.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/states.dart';
import 'package:ui/presentation/screen/home/home.dart';
import 'package:ui/presentation/screen/on_board/sign_up_page.dart';
import 'package:ui/presentation/screen/splash_screen/intro_page.dart';

import '../home/bloc_for_app/bloc_for_on_board/bloc.dart';

class LoginPage extends StatelessWidget {
  var emailController=TextEditingController();
  var passController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),centerTitle: true,backgroundColor: Colors.blue,),
     body: Padding(
       padding: const EdgeInsets.only(left: 10,right: 10),
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Welcome to Expense',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400)),
           mySizeBox(),
         myTextFiled(controllerName: emailController, label: 'Email',hint: 'Enter your Email',suffixText: '@gmail.com'),
           mySizeBox(),
         myTextFiled(controllerName: passController, label: 'Password',hint: 'Enter your Password',suffixIcon: Icon(Icons.visibility_off),obscureText: true),
           mySizeBox(),
         BlocListener<UserBloc,UserState>(
           listener: (context, state) {
             if(state is LoadedS){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
             }
             else if(state is ErrorS){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
             }
           },
           child: ElevatedButton(onPressed: (){
             context.read<UserBloc>().add(LoginEvent(
                 email: '${emailController.text.toString()}@gmail.com',
                 pass:passController.text.toString() ));}, child: Text('Login',style: TextStyle(fontSize: 20))),

         ),
           mySizeBox(),
           InkWell(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage(),));
           },
               child: Text('New User? Create Account now',style: TextStyle(fontSize: 22,color: Colors.purple.shade600),)),


       ],
       ),
     ),
    );
  }
}

// var db=MyDataHelper.db;
// var check=await db.login(email: '${emailController.text.toString()}@gmail.com',pass:passController.text.toString());
// if(check){
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
// }else{
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invaid Username or Password')));
// }