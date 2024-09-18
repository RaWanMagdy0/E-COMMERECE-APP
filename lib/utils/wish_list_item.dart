import 'package:e_comerence_app/ui/tabs/wish_list_tab/cubit/wish_list_screen_view_model.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.greyColor, width: 1.w),
        ),
        width: 400.w,
        height: 180.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 160.h,
              width: 130.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.network(
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
                      children: [
                        Expanded(
                          child: Text(
                            dataResponseEntity.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            WishListScreenViewModel.get(context)
                                .deleteItemInWishList(
                                    dataResponseEntity.id ?? "");
                          },
                          child:Image.asset(MyAssets.selectedFavIcon)
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
                            color: AppColors.primaryColor,
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
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        InkWell(
                          onTap: () {
                         //   ProductListViewModel.get(context).addToCart(productEntity.id ?? "");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(120.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
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
