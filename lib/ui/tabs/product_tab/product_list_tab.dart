import 'package:e_comerence_app/ui/home/cart/cart_screen.dart';
import 'package:e_comerence_app/ui/tabs/product_tab/cubit/product_list_states.dart';
import 'package:e_comerence_app/ui/tabs/product_tab/cubit/product_list_view_model.dart';
import 'package:e_comerence_app/utils/grid_view_card_item.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:e_comerence_app/utils/my_color.dart';
import 'package:e_comerence_app/utils/productDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/di.dart';
import '../../../utils/custom_text_field.dart';

class ProductListTab extends StatelessWidget {
  ProductListViewModel viewModel = ProductListViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      addToWishListUseCase: injectAddToWishListUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getProducts(),
      child: BlocBuilder<ProductListViewModel, ProductListTabStates>(
          builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
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
                      child: Badge(
                        label: Text(viewModel.numOfCartItems.toString()),
                        child: ImageIcon(
                          AssetImage(MyAssets.shoppingCartIcon),
                          size: 28.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                state is ProductListTabLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                            itemCount: viewModel.productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.4,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h),
                            itemBuilder: (context, index) {
                              return Material(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ProductDetailsView.routName,
                                        arguments:
                                            viewModel.productList[index]);
                                  },
                                  child: GridViewCardItem(
                                    productEntity: viewModel.productList[index],
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            ),
          ),
        );
      }),
    );
  }
}
