import 'package:e_comerence_app/data/di.dart';
import 'package:e_comerence_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_comerence_app/utils/brand_section.dart';
import 'package:e_comerence_app/utils/brands_row.dart';
import 'package:e_comerence_app/utils/categories_row.dart';
import 'package:e_comerence_app/utils/category_section.dart';
import 'package:e_comerence_app/utils/my_assets.dart';
import 'package:e_comerence_app/utils/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/announcements_section.dart';
import '../../../utils/custom_search.dart';
import 'cubit/home_tab_view_model.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeTab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getAllCategoriesUseCase: injectGetAllCategoryUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel
          ..getAllCategories()
          ..getBrands(),
        builder: (context, state) {
          return SafeArea(
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
                          CustomSearch(),
                          SizedBox(
                            height: 18.h,
                          ),
                          AnnouncementSection(),
                          SizedBox(
                            height: 16.h,
                          ),
                          CategoriesRowWidget(),
                          SizedBox(
                            height: 24.h,
                          ),
                          state is HomeTabCategoryLoadingStates
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : CategorySection(
                                  categoryList: viewModel.categoriesList,
                                ),
                          SizedBox(
                            height: 24.h,
                          ),
                          BrandssRowWidget(),
                          SizedBox(
                            height: 24.h,
                          ),
                          state is HomeTabBrandLoadingStates
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              : BrandsSection(brandList: viewModel.brandsList),
                          SizedBox(
                            height: 20.h,
                          ),
                        ]),
                  )));
        });
  }
}
