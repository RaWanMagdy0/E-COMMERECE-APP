import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

class TextFieldItem extends StatelessWidget {
  String hintText;
  var suffixIcon;
  String fieldName;
  String? Function(String?)? validator;
  TextInputType keyBordType;

  bool isObscure;

  TextEditingController controller;

  TextFieldItem({
    required this.hintText,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.keyBordType = TextInputType.text,
    required this.fieldName,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        fieldName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.whiteColor,
              fontSize: 18.sp,
            ),
        textAlign: TextAlign.start,
      ),
      Padding(
        padding: EdgeInsets.only(
          top: 24.h,
          bottom: 20.h,
        ),
        child: TextFormField(
          decoration: InputDecoration(
              fillColor: AppColors.whiteColor,
              filled: true,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.greyColor),
              suffixIcon: suffixIcon),
          style: TextStyle(
            color: AppColors.blackColor,
          ),
          validator: validator,
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyBordType,
        ),
      ),
    ]);
  }
}
