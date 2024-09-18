import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/entities/ProductResponseEntity.dart';
import '../ui/tabs/product_tab/cubit/product_list_view_model.dart';
import '../ui/tabs/wish_list_tab/cubit/wish_list_screen_view_model.dart';
import 'my_color.dart';

class GridViewCardItem extends StatefulWidget {
  ProductEntity productEntity;

  GridViewCardItem({required this.productEntity});

  @override
  State<GridViewCardItem> createState() => _GridViewCardItemState();
}

class _GridViewCardItemState extends State<GridViewCardItem> {
  bool isWishListSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryColor, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  widget.productEntity.imageCover ?? "",
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: InkWell(
                      onTap: () {
                        ProductListViewModel.get(context).addToWishList(widget.productEntity.id ?? "");
                        setState(() {
                          isWishListSelected = !isWishListSelected;
                        });
                      },
                      child: Image.asset(isWishListSelected
                          ? MyAssets.selectedFavIcon
                          : MyAssets.unSelectedWishListIcon)))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.productEntity.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              Text(
                "EGP ${widget.productEntity.price}",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Review (${widget.productEntity.ratingsAverage})",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Image.asset(
                MyAssets.starIcon,
              ),
              SizedBox(
                width: 10.w,
              ),
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  ProductListViewModel.get(context)
                      .addToCart(widget.productEntity.id ?? "");
                },
                splashColor: Colors.transparent,
                child: Icon(
                  Icons.add_circle,
                  size: 32.sp,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          // ),
        ]),
      ),
    );
  }
}
