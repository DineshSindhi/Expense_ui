import 'package:flutter/material.dart';

 myTextFiled({required TextEditingController controllerName,required String label, String? hint,keyboardType=TextInputType.text,
   String? suffixText,Icon? suffixIcon,String? prefixText,bool obscureText=false}){
   return TextField(
     controller: controllerName,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(label: Text(label),hintText: hint,
     suffixText: suffixText,
     suffixIcon: suffixIcon,
     prefixText: prefixText,
     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
   );
 }
 mySizeBox(){
   return SizedBox(
     height: 10,
   );
}