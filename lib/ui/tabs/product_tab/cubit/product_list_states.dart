import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/ProductResponseEntity.dart';

import '../../../../domain/entities/AddToWishListResponseEntity.dart';

abstract class ProductListTabStates {}

class ProductListTabInitialState extends ProductListTabStates {}

class ProductListTabSuccessState extends ProductListTabStates {
  ProductResponseEntity productResponseEntity;

  ProductListTabSuccessState({required this.productResponseEntity});
}

class ProductListTabLoadingState extends ProductListTabStates {
  String? loadingMessage;

  ProductListTabLoadingState({required this.loadingMessage});
}

class ProductListTabErrorState extends ProductListTabStates {
  Failures errors;

  ProductListTabErrorState({required this.errors});
}

class AddToCartInitialStates extends ProductListTabStates {}

class AddToCartErrorStates extends ProductListTabStates {
  Failures errors;

  AddToCartErrorStates({required this.errors});
}

class AddToCartLoadingStates extends ProductListTabStates {
  String? loadingMessage;

  AddToCartLoadingStates({required this.loadingMessage});
}

class AddToCartSuccessStates extends ProductListTabStates {
  AddToCartResponseEntity responseEntity;

  AddToCartSuccessStates({required this.responseEntity});
}

class AddToWishListInitialStates extends ProductListTabStates {}

class AddToWishListLoadingStates extends ProductListTabStates {
  String? loadingMessage;

  AddToWishListLoadingStates({required this.loadingMessage});
}

class AddToWishListErrorStates extends ProductListTabStates {
  Failures? error;

  AddToWishListErrorStates({required this.error});
}

class AddToWishListSuccessStates extends ProductListTabStates {
  AddToWishListResponseEntity responseEntity;

  AddToWishListSuccessStates({required this.responseEntity});
}
