import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

Widget CustomBottomNavigatioBar(
    {required int selectedIndex,
    required Function(int) onTabFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20.r),
      topLeft: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTabFunction,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 0
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                AssetImage(
                  MyAssets.notSelectedHomeIcon,
                ),
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                AssetImage(
                  MyAssets.notSelectenCategoryIcon,
                ),
              ),
            ),
            label: 'Category'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 2
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                AssetImage(MyAssets.notselectedWishListIcon),
              ),
            ),
            label: 'WishList'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 3
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                AssetImage(MyAssets.notselectedProfileIcon),
              ),
            ),
            label: 'profile'),
      ],
    ),
  );
}
