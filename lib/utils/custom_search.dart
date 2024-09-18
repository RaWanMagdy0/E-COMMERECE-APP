import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/di.dart';
import '../ui/home/cart/cart_screen.dart';
import '../ui/tabs/product_tab/cubit/product_list_view_model.dart';
import 'custom_text_field.dart';
import 'my_color.dart';

class CustomSearch extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const Expanded(
          child: CustomTextField(),
        ),
        SizedBox(
          width: 25.w,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(MyAssets.shoppingCartIcon),
              size: 28.sp,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
