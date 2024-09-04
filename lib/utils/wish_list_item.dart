import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../domain/entities/GetWishListResponseEntity.dart';
import 'my_color.dart';

class WishListItem extends StatelessWidget {
  DataResponseEntity dataResponseEntity;

  WishListItem({required this.dataResponseEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 24.h, bottom: 24.h, right: 16.w, left: 16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.greyColor, width: 1.w),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.asset(
                dataResponseEntity.imageCover.toString(),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dataResponseEntity.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 15.w,
                          ),
                        ),
                        Text(
                          "quantity: ${dataResponseEntity.quantity}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP ${dataResponseEntity.price}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: Text("Add To Cart"),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
