import 'package:e_comerence_app/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState(loadingMessage: "Loading..."));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
