import 'package:e_comerence_app/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  bool isObsecure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }
  }
}
