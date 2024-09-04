import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

class CategoriesOrBrandsRowWidget extends StatelessWidget {
  String name;

  CategoriesOrBrandsRowWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.darkPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.darkPrimaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
