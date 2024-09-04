import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_color.dart';
import '../../../utils/shared_preference_utils.dart';
import '../../auth/login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(children: [
                    Image.asset(
                      MyAssets.logo,
                    ),
                    SizedBox(
                      width: 190.w,
                    ),
                    IconButton(
                        onPressed: () {
                          SharedPreferenceUtils.removeData('Token');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginScreen.routName, (route) => false);
                        },
                        icon: Icon(Icons.logout))
                  ]),
                  SizedBox(
                    height: 18.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
