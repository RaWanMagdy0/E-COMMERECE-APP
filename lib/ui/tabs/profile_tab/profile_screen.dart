import 'package:e_comerence_app/main.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:e_comerence_app/utils/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/shared_preference_utils.dart';
import '../../../utils/text_field_item.dart';
import '../../auth/login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Image.asset(
                    MyAssets.logo,
                  ),

                  IconButton(
                      onPressed: () {
                        SharedPreferenceUtils.removeData('Token');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routName, (route) => false);
                      },
                      icon: Icon(Icons.logout))
                ]),
              ),
              Column(
                children: [
                  Text(
                    "Welcome, Mohamed",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "mohamed.N@gmail.com",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your full name",style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkPrimaryColor),),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mohamed Mohamed Nabil",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPrimaryColor),
                                    ),

                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your E-mail",style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkPrimaryColor),),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "mohamed.N@gmail.com",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPrimaryColor),
                                    ),

                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your password",style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkPrimaryColor),),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "****************",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPrimaryColor),
                                    ),

                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your mobile number",style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkPrimaryColor),),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "01122118855",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPrimaryColor),
                                    ),

                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Address",style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkPrimaryColor),),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "6th October, street 11.....",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkPrimaryColor),
                                    ),

                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.edit))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
