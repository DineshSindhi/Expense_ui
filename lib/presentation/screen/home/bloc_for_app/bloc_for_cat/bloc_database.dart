import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/data/model/expense-model.dart';
import 'package:ui/data/repository/local/local_database.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_cat/states.dart';

import 'events.dart';

class CatBloc extends Bloc<CatEvent,CatState>{
  var db= MyDataHelper.db;
  CatBloc({required this.db}):super(IntiGretState()){
    on<AddExpense>((event, emit) async {
      emit(LoadingState());
      bool isAdd= await db.addExpense(expenseModel: event.allExpense);
      if(isAdd){
        List<ExpenseModel>mData=await db.fecExpense();
        emit(LoadedState(allExpense:mData));
      }else{
        emit(ErrorState(msg: "Error - Not Add"));
      }
    });
    on<GetExpense>((event, emit) async {
      emit(LoadingState());
      List<ExpenseModel>mData=await db.fecExpense();
      emit(LoadedState(allExpense:mData));
    });
  }


}