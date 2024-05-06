import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBtn extends StatelessWidget {
  String name;
  Widget? mWidget;
  Color btnColor;
  Color textColor;
   VoidCallback onTap;
  MyAppBtn({
    required this.name,
    required this.btnColor,
    required this.textColor,
    required this.onTap,
    this.mWidget
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        child: mWidget??Text(name,style: TextStyle(fontSize: 18,color: textColor),),
      style: ElevatedButton.styleFrom(backgroundColor: btnColor),),
    );
  }
}

