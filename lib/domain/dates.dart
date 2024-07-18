 import 'package:intl/intl.dart';
import '../data/model/expense-model.dart';
import '../data/model/filtered_time_model.dart';

 filteredDate({required List<ExpenseModel> allNExpense, required DateFormat dName,required List<FilteredTimeModel> listName})  {
   listName.clear();
  List<String>uniqueDates = [];
  for (ExpenseModel eachExpense in allNExpense) {
    var createTime = eachExpense.time;
    var time = DateTime.fromMillisecondsSinceEpoch(int.parse(createTime));
    var expenseTime = dName.format(time);
   // print(expenseTime);
    if (!uniqueDates.contains(expenseTime)) {
      uniqueDates.add(expenseTime);
     // print(uniqueDates);
    }
  }
  for (String eachTime in uniqueDates) {
    num totalAmt = 0.0;
    List<ExpenseModel> mData = [];

    for (ExpenseModel eachExpense in allNExpense) {
      var createTime = eachExpense.time;
      var time = DateTime.fromMillisecondsSinceEpoch(int.parse(createTime));
      var expenseTime = dName.format(time);
      if (expenseTime == eachTime) {
        mData.add(eachExpense);
        if (eachExpense.type == 'Debit') {
          totalAmt -= int.parse(eachExpense.amount);
        } else {
          totalAmt += int.parse(eachExpense.amount);
        }
      }
    }
    listName.add(FilteredTimeModel(
        title: eachTime,
        totalAmount: totalAmt.toString(),
        allFExpense: mData));
  }
}