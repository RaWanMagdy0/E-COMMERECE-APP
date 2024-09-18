import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../data/di.dart';
import '../domain/entities/ProductResponseEntity.dart';
import '../ui/home/cart/cart_screen.dart';
import '../ui/tabs/product_tab/cubit/product_list_view_model.dart';
import 'my_color.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routName = 'ProductDetailsView';
 late ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text('Product Details'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkPrimaryColor,
            ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage(MyAssets.shoppingCartIcon),
                  size: 40.sp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.greyColor, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: AppColors.primaryColor,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    indicatorPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: args.images!
                        .map((url) => Image.network(
                              url,
                              fit: BoxFit.cover,
                              height: 300.h,
                              width: double.infinity,
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkPrimaryColor,
                          ),
                    ),
                  ),
                  Text(
                    "EGP ${args.price}" ?? "",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkPrimaryColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                              color: AppColors.primaryColor, width: 1)),
                      child: Text(
                        "${args.sold} Sold" ?? "",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkPrimaryColor,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Image.asset(MyAssets.starIcon),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      " ${args.ratingsAverage}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkPrimaryColor,
                          ),
                    ),
                  ],
                )),
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

                          },
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 28.sp,
                          )),
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            ProductListViewModel.get(context)
                                .addToCart(productEntity.id ?? "");
                          },
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 28.sp,
                          )),
                    ],
                  ),
                )
              ]),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                args.description ?? "",
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor.withOpacity(0.6),
                    ),
                trimCollapsedText: "show more",
                trimExpandedText: "show less",
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
                lessStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkPrimaryColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Total price",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.primaryColor)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("EGP ${args.price} ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor)),
                    ],
                  ),
                  SizedBox(width: 32.w),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_outlined,
                                ),
                                Text(
                                  "Add to cart",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
