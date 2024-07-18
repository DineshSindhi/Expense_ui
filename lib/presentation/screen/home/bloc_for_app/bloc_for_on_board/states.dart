import 'package:ui/data/model/user_model.dart';

abstract class UserState{}
class IntiGretStates extends UserState{}
class LoadingS extends UserState{}
class LoadedS extends UserState{
  List<UserModel> allUser=[];
  LoadedS({required this.allUser});
}
class ErrorS extends UserState{
  String msg;
  ErrorS({required this.msg});
}