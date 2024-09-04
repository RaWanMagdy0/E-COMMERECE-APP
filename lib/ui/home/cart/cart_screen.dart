import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/di.dart';
import '../../../utils/cart_item.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_color.dart';
import 'cubit/cart_screen_states.dart';
import 'cubit/cart_screen_view_model.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'CartScreen';
  CartScreenViewModel viewModel = CartScreenViewModel(
    getCartUseCase: injectGetCartUseCase(),
    deleteItemInCartUseCase: injectDeleteItemInCartUseCase(),
    updateCountInCartUseCase: injectUpdateCountInCartUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartScreenViewModel>(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
          builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              title: Text('Cart'),
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primaryColor,
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkPrimaryColor,
                  ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    child: ImageIcon(
                      AssetImage(MyAssets.shoppingCartIcon),
                      size: 28.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            body: state is CartScreenSuccessStates
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CartItem(
                                productEntity: state
                                    .cartResponseEntity.data!.products![index]);
                          },
                          itemCount: state.cartResponseEntity.numOfCartItems,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 98.h, left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 12.h,
                                    ),
                                    child: Text(
                                      'EGP ${state.cartResponseEntity.data?.totalCartPrice ?? 0}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 48.h,
                                width: 270.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 12.h,
                                    bottom: 12.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 83.w),
                                        child: Text(
                                          'Check Out',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 27.w, right: 32.w),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20.w,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ));
      }),
    );
  }
}
