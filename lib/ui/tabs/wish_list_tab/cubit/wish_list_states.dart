import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';

abstract class WishListStates {}

class WishListInitialStates extends WishListStates {}

class WishListLoadingStates extends WishListStates {
  String? loadingMessage;

  WishListLoadingStates({required this.loadingMessage});
}

class WishListErrorStates extends WishListStates {
  Failures errorMessage;

  WishListErrorStates({required this.errorMessage});
}

class WishListSuccessStates extends WishListStates {
  GetWishListResponseEntity wishListResponseEntity;

  WishListSuccessStates({required this.wishListResponseEntity});
}
