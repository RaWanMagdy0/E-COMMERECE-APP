import 'package:e_comerence_app/utils/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/home/category_type/category_type_screen.dart';

class CategoriesRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.darkPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, CategoriesTypeScreen.routeName);
            },
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
