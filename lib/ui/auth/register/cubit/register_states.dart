import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}
class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({this.errorMessage});
}
class RegisterSuccessState extends RegisterStates {
  //response
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}
