import 'package:e_comerence_app/data/di.dart';
import 'package:e_comerence_app/ui/tabs/wish_list_tab/cubit/wish_list_screen_view_model.dart';
import 'package:e_comerence_app/ui/tabs/wish_list_tab/cubit/wish_list_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/custom_text_field.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_color.dart';
import '../../../utils/wish_list_item.dart';
import '../../home/cart/cart_screen.dart';

class WishListScreen extends StatelessWidget {
  static const String routeName = 'WishListScreen';
  WishListScreenViewModel viewModel =
      WishListScreenViewModel(getWishListUseCase: injectGetWishListUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getWishList(),
      child: BlocBuilder<WishListScreenViewModel, WishListStates>(
          builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Image.asset(
                        MyAssets.logo,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(children: [
                        Expanded(
                          child: CustomTextField(),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                            },
                            child: ImageIcon(
                              AssetImage(MyAssets.shoppingCartIcon),
                              size: 28.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      ]),
                      SizedBox(height: 20.h),
                      state is WishListSuccessStates
                          ? Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return WishListItem(
                                            dataResponseEntity: state
                                                .wishListResponseEntity
                                                .data![index]);
                                      },
                                      itemCount:
                                          state.wishListResponseEntity.count,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                    ])),
          ),
        );
      }),
    );
  }
}
