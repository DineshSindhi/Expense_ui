import 'package:flutter/material.dart';

 myTextFiled({required TextEditingController controllerName,required String label,required String hint}){
   return TextField(
     controller: controllerName,
    decoration: InputDecoration(label: Text(label),hintText: hint,
     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
   );
 }
 mySizeBox(){
   return SizedBox(
     height: 10,
   );
}