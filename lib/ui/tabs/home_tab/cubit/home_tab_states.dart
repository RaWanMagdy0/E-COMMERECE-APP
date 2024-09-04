import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates {}

class HomeTabCategoryLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabCategoryLoadingStates({required this.loadingMessage});
}

class HomeTabCategoryErrorStates extends HomeTabStates {
  String? errorMessage;

  HomeTabCategoryErrorStates({required this.errorMessage});
}

class HomeTabCategorySuccuessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabCategorySuccuessStates({required this.responseEntity});
}

class HomeTabBrandLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabBrandLoadingStates({required this.loadingMessage});
}

class HomeTabBrandErrorStates extends HomeTabStates {
  String? errorMessage;

  HomeTabBrandErrorStates({required this.errorMessage});
}

class HomeTabBrandSuccuessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabBrandSuccuessStates({required this.responseEntity});
}
