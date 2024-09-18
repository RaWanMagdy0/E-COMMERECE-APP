import 'package:e_comerence_app/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_color.dart';
import '../../../../utils/shared_preference_utils.dart';
import '../../../auth/login/login_screen.dart';

class ProfileScreeen extends StatelessWidget {
   RegisterResponseEntity? responseEntity;

  ProfileScreeen({ this.responseEntity});

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
                          icon: Icon(Icons.logout)),
                    ])),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, ${responseEntity?.user?.name}"
                    ,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    "rawa.magy@gmail.com"
                    //   user.email!
                    ,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor),
                  ),
                  SizedBox(height: 20),
                  CustomProfileField('Your full name', "rawan"),
                  CustomProfileField('Your E-mail', "rawa.magy@gmail.com"),
                  CustomProfileField('Your password', '**************'),
                  CustomProfileField('Your mobile number', '**************'),
                  CustomProfileField(
                      'Your Address', '6th October, street 11.....'),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget CustomProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkPrimaryColor),
        ),
        TextFormField(
          initialValue: value,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkPrimaryColor),
          // readOnly: true,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
