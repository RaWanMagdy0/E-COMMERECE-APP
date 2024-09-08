import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/di.dart';
import '../ui/home/cart/cart_screen.dart';
import '../ui/tabs/product_tab/cubit/product_list_view_model.dart';
import 'custom_text_field.dart';
import 'my_color.dart';

class CustomSearch extends StatelessWidget {
  ProductListViewModel viewModdel = ProductListViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      addToWishListUseCase: injectAddToWishListUseCase());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomTextField(),
        ),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          child: Material(
            type: MaterialType.transparency,
            child: Badge(
              label: Text(viewModdel.numOfCartItems.toString()),
              child: ImageIcon(
                AssetImage(MyAssets.shoppingCartIcon),
                size: 28.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
