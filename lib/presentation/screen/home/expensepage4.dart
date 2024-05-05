import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui/presentation/screen/splash_screen/intro_page.dart';
import '../on_board/login_page.dart';

class ExpensePage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: InkWell(
              onTap: ()async{
                var pref= await SharedPreferences.getInstance();
                pref.setInt(IntroPage.KEY, 0);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

              },
              child: Text('Logout',style: TextStyle(fontSize: 30),)),
        ),

      )),
    );
  }
}
