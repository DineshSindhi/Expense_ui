import 'package:flutter/material.dart';

import '../on_board/login_page.dart';

class ExpensePage4 extends StatelessWidget {
  const ExpensePage4({super.key});

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
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              },
              child: Text('Logout',style: TextStyle(fontSize: 30),)),
        ),

      )),
    );
  }
}
