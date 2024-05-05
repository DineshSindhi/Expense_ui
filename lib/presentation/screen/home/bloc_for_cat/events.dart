import '../../../../data/model/expense-model.dart';

abstract class CatEvent{}
class AddExpense extends CatEvent{
  ExpenseModel allExpense;
  AddExpense({required this.allExpense});
}
class GetExpense extends CatEvent{}