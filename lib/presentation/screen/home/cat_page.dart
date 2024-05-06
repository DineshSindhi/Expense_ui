import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui/domain/cat_list.dart';
import 'package:ui/domain/myapp_bts.dart';
import 'package:ui/domain/ui_helper.dart';
import 'package:ui/presentation/screen/home/bloc_for_cat/bloc_database.dart';
import 'package:ui/presentation/screen/home/bloc_for_cat/events.dart';

import '../../../data/model/expense-model.dart';

class CatPage extends StatefulWidget {
  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  var titleController=TextEditingController();
  var descController=TextEditingController();
  var amountController=TextEditingController();
  int balance=0;
  var catIndex=-1;
  var transactionType='Debit';
  var expenseTime=DateTime.now();
  String Error='';
  String rror='';

  Future<void> _selectedDate() async {
   final DateTime? selectedDate= await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2000,2,15),
       lastDate: DateTime.now());
   if(selectedDate !=null){
     setState(() {
       expenseTime=selectedDate;
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          myTextFiled(controllerName: titleController, label: 'Title',),mySizeBox(),
          myTextFiled(controllerName: descController, label: 'Desc',), mySizeBox(),
          myTextFiled(controllerName: amountController, label: 'Amount',keyboardType:TextInputType.number,prefixText: '\u{20B9}'),mySizeBox(),
            Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(5),
              ),
             child: Center(
               child: DropdownButton(
                 dropdownColor: Colors.blue.shade500,
                 value: transactionType,
                 onChanged: (newValue) {
                   setState(() {
                     transactionType=newValue!;
                   });

                 },
                 items: ['Debit','Credit'].map((type) {
                   return DropdownMenuItem(
                     value: type,
                       child: Text(type,style: TextStyle(color: Colors.white),),
                   );
                 }).toList(),
               ),
             ),
            ),
            MyAppBtn(name: 'Category', btnColor: Colors.blue.shade500, textColor: Colors.white,
                mWidget: catIndex!=-1?
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Image.asset(AppCatData.mCategory[catIndex].catImage,width: 40,height: 40,),
                  Text(' -  ${AppCatData.mCategory[catIndex].catTitle}',style: TextStyle(fontSize: 19,color: Colors.white),),
                ],):null,
                onTap: (){
              showModalBottomSheet(context: context, builder: (context) => CatBottomShit(),);
            }),

            MyAppBtn(name: DateFormat.yMMMMd().format(expenseTime),
                btnColor: Colors.blue.shade500, textColor: Colors.white, onTap: (){
              _selectedDate();
                }),
            MyAppBtn(name: 'Add Expense', btnColor: Colors.blue.shade500, textColor: Colors.white, onTap: (){
              if(titleController.text.isNotEmpty&&descController.text.isNotEmpty&&
                  amountController.text.isNotEmpty&&catIndex!=-1){
                context.read<CatBloc>().add(AddExpense(allExpense:
                ExpenseModel(
                  uid: 0,
                  id: 0,
                  title: titleController.text.toString(),
                  desc: descController.text.toString(),
                  time: expenseTime.millisecondsSinceEpoch.toString(),
                  amount: '\u{20B9} ${amountController.text.toString()}',
                  cid: AppCatData.mCategory[catIndex].catId,
                  balance: balance.toString(),
                  type: transactionType,
                )));
                Navigator.pop(context);
              }
              else{
               // Error=' Please Enter Required Details';
              }
              setState(() {

              });
            }),
           // Text('$Error',style: TextStyle(fontSize: 20),),

        ],
        ),
      ),
    );
  }

  Widget CatBottomShit(){
    return GridView.builder(
      itemCount: AppCatData.mCategory.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
    ), itemBuilder: (context, index) {
      var catI=AppCatData.mCategory[index];
      return InkWell(
        onTap: (){
          setState(() {
            catIndex=index;
          });
          Navigator.pop(context);

        },
        child: Container(
          margin: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.cyan.shade100,
          ),
          child: Image.asset(catI.catImage),
        ),
      );
    },);
  }
}
