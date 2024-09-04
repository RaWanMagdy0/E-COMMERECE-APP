import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';
import 'package:e_comerence_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_comerence_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/get_all_categories_use_case.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialStates());
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(HomeTabCategoryLoadingStates(loadingMessage: "Loading..."));
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeTabCategoryErrorStates(errorMessage: error.errorMessage));
    }, (response) {
      categoriesList = response.data ?? [];
      if (brandsList.isNotEmpty) {
        emit(HomeTabCategorySuccuessStates(responseEntity: response));
      }
    });
  }

  void getBrands() async {
    emit(HomeTabBrandLoadingStates(loadingMessage: "Loading..."));
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeTabBrandErrorStates(errorMessage: error.errorMessage));
    }, (response) {
      brandsList = response.data ?? [];
      if (categoriesList.isNotEmpty) {
        emit(HomeTabBrandSuccuessStates(responseEntity: response));
      }
    });
  }
}
