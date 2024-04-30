import 'package:flutter/material.dart';

import 'home2.dart';
import 'home3.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>PageList=[
    HomePage2(),
    HomePage3(),
    Center(child: Text('Hi'),),
    Center(child: Text('Hi'),),
    Center(child: Text('Hi'),),
  ];
  int selected=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorShape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11)
        ),
        //OutlineInputBorder(borderRadius:BorderRadius.circular(12) ),
        //BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),

        indicatorColor: Colors.pinkAccent,
        backgroundColor: Colors.white,
        selectedIndex: selected,
        onDestinationSelected: (value){
          selected=value;
          setState(() {

          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.line_weight), label: 'line'),
          NavigationDestination(icon: Icon(Icons.notifications), label: 'Notification'),
          NavigationDestination(icon: Icon(Icons.accessibility_rounded), label: 'Profile'),
        ],
      ),
      body: PageList[selected],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );

  }
}
