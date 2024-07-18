import '../../../../../data/model/expense-model.dart';

abstract class CatState{}
class IntiGretState extends CatState{}
class LoadingState extends CatState{}
class LoadedState extends CatState{
  List<ExpenseModel> allExpense=[];
  LoadedState({required this.allExpense});
}
class ErrorState extends CatState{
  String msg;
  ErrorState({required this.msg});
}
