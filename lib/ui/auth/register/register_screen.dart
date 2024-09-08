import 'package:e_comerence_app/data/di.dart';
import 'package:e_comerence_app/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_comerence_app/ui/auth/register/cubit/register_states.dart';
import 'package:e_comerence_app/utils/dialog_utils.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_color.dart';
import '../../../utils/shared_preference_utils.dart';
import '../../../utils/text_field_item.dart';
import '../../home/home_screen/home_screen_view.dart';
import '../../tabs/home_tab/home_tab.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(
                context, state.loadingMessage ?? "Waiting..");
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage.toString(),
                title: 'Error', posActionName: 'OK');
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context, state.response.userEntity?.name ?? "",
                title: 'Success', posActionName: 'OK');

          }
        },
        child: Scaffold(
          body: Container(
            color: AppColors.mainColor,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                    child: Image.asset(MyAssets.rout),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Form(
                            key: viewModel.formKey,
                            child: Column(children: [
                              TextFieldItem(
                                hintText: 'enter your name',
                                fieldName: 'Full Name',
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                hintText: 'enter your email address',
                                keyBordType: TextInputType.emailAddress,
                                fieldName: 'E_mail address',
                                controller: viewModel.emailController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "please enter email address";
                                  }
                                  final bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailValid) {
                                    return "please enter valid email";
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                hintText: 'enter your password',
                                fieldName: 'Password',
                                controller: viewModel.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your password";
                                  }
                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return "Please enter a minimum of 6 char";
                                  }
                                  return null;
                                },
                                keyBordType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObsecure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObsecure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObsecure) {
                                      viewModel.isObsecure = false;
                                    } else {
                                      viewModel.isObsecure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                hintText: 'Confirmation password',
                                fieldName: 'Enter your Confirmation password',
                                controller:
                                    viewModel.confirmationPasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter Confirmation password";
                                  }
                                  if (value !=
                                      viewModel.passwordController.text) {
                                    return 'password does not match';
                                  }
                                  return null;
                                },
                                isObscure: viewModel.isObsecure,
                                keyBordType: TextInputType.visiblePassword,
                                suffixIcon: InkWell(
                                  child: viewModel.isObsecure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObsecure) {
                                      viewModel.isObsecure = false;
                                    } else {
                                      viewModel.isObsecure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                hintText: 'enter your mobile number',
                                fieldName: 'Mobile number',
                                controller: viewModel.phoneController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your mobile number";
                                  } else if (value.trim().length < 11) {
                                    return 'Please enter valid mobile number';
                                  }
                                  return null;
                                },
                                keyBordType: TextInputType.phone,
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ElevatedButton(
                              onPressed: () {
                                viewModel.register();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.r)),
                                  )),
                              child: SizedBox(
                                height: 64.h,
                                width: 398.w,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          HomeScreenView.routeName, (route) => false);
                                      initState();
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: AppColors.primaryColor,
                                              fontSize: 20.sp),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
