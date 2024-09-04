import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

class CategoryItem extends StatelessWidget {
  CategoryOrBrandEntity categoryEntity;

  CategoryItem({required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                  categoryEntity.image ?? "",
                )),
                borderRadius: BorderRadius.circular(50.r),
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 8,
            child: Text(
              categoryEntity.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkPrimaryColor,
                  ),
            )),
      ],
    );
  }
}
