import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/data/model/user_model.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/events.dart';
import 'package:ui/presentation/screen/home/bloc_for_app/bloc_for_on_board/states.dart';
import '../../../../../data/repository/local/local_database.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  var db= MyDataHelper.db;
  UserBloc({required this.db}):super(IntiGretStates()){
    on<AddUserEvent>((event, emit) async {
      bool isAdd= await db.addUser(userModel: event.allUser);
      if(isAdd){
        List<UserModel>mData=await db.fecUser();
        emit(LoadedS(allUser:mData));
      }else{
        emit(ErrorS(msg: "Email Already Exist"));
      }
    });
    on<LoginEvent>((event, emit) async {
      var Login= await db.login(email: event.email, pass: event.pass);
      if(Login){
        List<UserModel>mData=await db.fecUser();
        emit(LoadedS(allUser:mData));
      }else{
        emit(ErrorS(msg: "Invalid Email And PassWord"));
      }
    });
    on<GetUser>((event, emit) async {
      emit(LoadingS());
      List<UserModel>mData=await db.fecUser();
      emit(LoadedS(allUser:mData));
    });
  }


}