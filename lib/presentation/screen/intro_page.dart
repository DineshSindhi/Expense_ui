import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ui/presentation/screen/home.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/pp.png'),
            Text('Monety',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent,
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        },
        child: Icon(Icons.arrow_right_alt_sharp,size: 38,),
      ),
      body:Stack(
        children: [
          Align(alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(15),
              height: 550,
              width: 420,
              decoration: BoxDecoration(color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Easy way to monitor',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700),),
                Text('Your expense',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                Text('Safe your future by managing your',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey)),
                Text('expense right now ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey)),
              ],
              ),
            ),
          ),
          SizedBox(
            height: 500,
              width: 500,
              child: Image.asset('assets/image/main.png',fit: BoxFit.fill,)),
        ],
      ),

    );
  }
}
