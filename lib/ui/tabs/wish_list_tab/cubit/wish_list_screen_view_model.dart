import 'package:e_comerence_app/domain/use_cases/delete_item_from_wish_list_use_case.dart';
import 'package:e_comerence_app/ui/tabs/wish_list_tab/cubit/wish_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/GetWishListResponseEntity.dart';
import '../../../../domain/use_cases/get_wish_list_use_case.dart';

class WishListScreenViewModel extends Cubit<WishListStates> {
  GetWishListUseCase getWishListUseCase;
  List<DataResponseEntity> wishList = [];
  DeleteItemFromWishListUseCase deleteItemInWishListUseCase;

  WishListScreenViewModel(
      {required this.getWishListUseCase,
      required this.deleteItemInWishListUseCase})
      : super(WishListInitialStates());


  getWishList() async {
    emit(WishListLoadingStates(loadingMessage: "Loading..."));
    var either = await getWishListUseCase.invoke();
    if (!isClosed) {
      either.fold((error) {
        emit(WishListErrorStates(errorMessage: error));
      }, (response) {
        wishList = response.data ?? [];
        emit(WishListSuccessStates(wishListResponseEntity: response));
      });
    }
  }

  static WishListScreenViewModel get(context) => BlocProvider.of(context);

  deleteItemInWishList(String productId) async {
    emit(DeleteItemInWishListLoadingStates(loadingMessage: 'Loading...'));
    var either = await deleteItemInWishListUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteItemInWishListErrorStates(errorMessage: l));
    }, (response) {
      emit(WishListSuccessStates(wishListResponseEntity: response));
    });
  }
}
