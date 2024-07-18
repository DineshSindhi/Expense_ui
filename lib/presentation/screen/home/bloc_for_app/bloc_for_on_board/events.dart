import 'package:ui/data/model/user_model.dart';

abstract class UserEvent{}
class AddUserEvent extends UserEvent{
  UserModel allUser;
  AddUserEvent({required this.allUser});
}
class LoginEvent extends UserEvent{
  String email;
  String pass;
  LoginEvent({required this.email,required this.pass});
}
class GetUser extends UserEvent{}