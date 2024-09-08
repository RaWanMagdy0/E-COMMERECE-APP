import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../domain/entities/GetCartResponseEntity.dart';
import '../ui/home/cart/cubit/cart_screen_view_model.dart';
import 'my_color.dart';

class CartItem extends StatelessWidget {
  GetProductEntity productEntity;

  CartItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              child: Image.network(
                productEntity.product?.imageCover ?? "",
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
                        Expanded(
                          child: Text(
                            productEntity.product?.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CartScreenViewModel.get(context).deleteItemInCart(
                                productEntity.product?.id ?? "");
                          },
                          child: Icon(
                            Icons.delete_outline,
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
                          "Count : ${productEntity.count}",
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
                          'EGP${productEntity.price}',
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
                          child: Row(
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    int count = productEntity.count ?? 0;
                                    count--;
                                    CartScreenViewModel.get(context)
                                        .updateCountInCart(
                                            productEntity.product?.id ?? "",
                                            count);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: Colors.white,
                                    size: 28.sp,
                                  )),
                              Text(
                                productEntity.count.toString(),
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor),
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    int count = productEntity.count ?? 0;
                                    count++;
                                    CartScreenViewModel.get(context)
                                        .updateCountInCart(
                                            productEntity.product?.id ?? "",
                                            count);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: Colors.white,
                                    size: 28.sp,
                                  )),
                            ],
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
