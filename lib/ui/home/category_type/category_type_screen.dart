import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/custom_text_field.dart';
import '../../../../../utils/my_assets.dart';
import '../../../../../utils/my_color.dart';
import '../cart/cart_screen.dart';

class CategoriesTypeScreen extends StatefulWidget {
  static const String routeName = "CategoriesTypeScreen";

  @override
  State<CategoriesTypeScreen> createState() => _CategoriesTypeScreenState();
}

class _CategoriesTypeScreenState extends State<CategoriesTypeScreen> {
  int selectedIndex = 1;

  // say women
  final List<String> menuItem = [
    'Men\'s Fashion',
    'Women\'s Fashion',
    'Skincare',
    'Beauty',
    'Headphones',
    'Cameras',
    'Laptops & Electronics',
    'Baby & Toys',
  ];
  List<String> womenItem = [
    "dresses",
    "jeans",
    "skirts",
    "pyjamas",
    "Bags",
    "T-shirts",
    "FootWear",
    "EyeWear",
    "Watches",
  ];
  List<String> menItem = [
    "T-shirts",
    "Shorts",
    "jeans",
    "Pants",
    "FootWear",
    "Suits",
    "Watches",
    "Bags",
    "EyeWear",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  MyAssets.logo,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: ImageIcon(
                        AssetImage(MyAssets.shoppingCartIcon),
                        size: 28.sp,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Color(0xFFEDF1F5),
                          width: 137.w,
                          height: 724.h,
                          child: ListView.builder(
                              itemCount: menuItem.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                      height: 100.h,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      child: Row(children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: selectedIndex == index
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                          ),
                                          width: 5,
                                          height: 90.h,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            menuItem[index],
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight:
                                                selectedIndex == index
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                        ),
                                      ])),
                                );
                              }),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Text(
                                selectedIndex == 0
                                    ? "Men's Fashion"
                                    : "Women's Fashion",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Image.asset(selectedIndex == 0
                                ? MyAssets.menFashion
                                : MyAssets.womenFashion),
                            SizedBox(height: 20.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2.h,
                                crossAxisSpacing: 2.w,
                              ),
                              itemCount: womenItem.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Image.asset(
                                        selectedIndex == 0
                                            ? MyAssets.tshirt
                                            : MyAssets.dress,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          selectedIndex == 0
                                              ? menItem[index]
                                              : womenItem[index],
                                          textWidthBasis:
                                          TextWidthBasis.longestLine,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                            fontSize: 12.sp,
                                            color:
                                            AppColors.darkPrimaryColor,
                                          ),
                                        )),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }}