import 'package:ui/data/model/cat_model.dart';

import 'expense-model.dart';

class FilteredTimeModel{
  String totalAmount;
  String? title;
  List<ExpenseModel> allFExpense;
  FilteredTimeModel({this.title,required this.totalAmount,required this.allFExpense});

}
