import 'package:e_comerence_app/main.dart';
import 'package:e_comerence_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:e_comerence_app/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../utils/dialog_utils.dart';
import '../../../utils/my_color.dart';
import '../../../utils/text_field_item.dart';
import '../register/register_screen.dart';
import 'cubit/login_screen_view_model.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(
              context, state.loadingMessage ?? "Waiting...");
        } else if (state is LoginErrorState) {
          print('Login error: ${state.errorMessage}'); // Debug print
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              title: 'Error', posActionName: "ok");
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.token!,
              title: 'Success', posActionName: "ok");
          SharedPreferenceUtils.saveData(
              key: "Token", value: state.response.token);
          Navigator.of(context).pushNamed(HomeScreenView.routeName);
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
                    top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                child: Image.asset(MyAssets.rout),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.whiteColor, fontSize: 24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'E-Mail Address',
                              hintText: 'enter your email address',
                              controller: viewModel.emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your email address';
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'invalid email';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'enter your password',
                              controller: viewModel.passwordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "please enter your password";
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return 'password should be >6 & <30';
                                }
                                return null;
                              },
                              isObscure: viewModel.isObscure,
                              keyBordType: TextInputType.visiblePassword,
                              suffixIcon: InkWell(
                                child: viewModel.isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onTap: () {
                                  if (viewModel.isObscure) {
                                    viewModel.isObscure = false;
                                  } else {
                                    viewModel.isObscure = true;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      'Forgot password',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.whiteColor),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                         viewModel.login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          )),
                      child: SizedBox(
                        height: 64.h,
                        width: 398.w,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreenView.routeName, (route) => false);
                            },
                            child: Text(
                              'Login',
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h,left: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Don't have an account ?" ,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.whiteColor)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text(
                        ' Create Account',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
