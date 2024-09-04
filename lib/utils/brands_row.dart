import 'package:e_comerence_app/utils/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandssRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Brands",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.darkPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        Material(
          child: InkWell(
            onTap: () {},
            child: Text(
              "View all",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}
