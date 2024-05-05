import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/data/model/expense-model.dart';
import 'package:ui/domain/ui_helper.dart';
import 'package:ui/presentation/screen/home/bloc_for_cat/bloc_database.dart';
import 'package:ui/presentation/screen/home/bloc_for_cat/events.dart';

class CatPage extends StatelessWidget {
  var titleController=TextEditingController();
  var descController=TextEditingController();
  var amountController=TextEditingController();
  var typeController=TextEditingController();
  var balanceController=TextEditingController();

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
          myTextFiled(controllerName: amountController, label: 'Amount',keyboardType:TextInputType.number,prefixText: 'Rs'),mySizeBox(),
          // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //   ElevatedButton(onPressed: (){}, child: Text('Debit')),
          //   ElevatedButton(onPressed: (){}, child: Text('Credit')),jack
          // ],),mySizeBox(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CatBloc>().add(AddExpense(allExpense:
                  ExpenseModel(title: titleController.text.toString(),
                      desc: descController.text.toString(),
                      time: DateTime.now().millisecondsSinceEpoch.toString(),
                      uid: 0,
                      amount: 'Rs${amountController.text.toString()}',)));
                  Navigator.pop(context);
                }, child: Text('Add')),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
              ],),
        ],
        ),
      ),
    );
  }
}
