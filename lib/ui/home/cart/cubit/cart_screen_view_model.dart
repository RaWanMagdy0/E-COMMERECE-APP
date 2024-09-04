import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/GetCartResponseEntity.dart';
import '../../../../domain/use_cases/delete_item_use_case.dart';
import '../../../../domain/use_cases/get_cart_use_case.dart';
import '../../../../domain/use_cases/update_count_in_cart_use_case.dart';
import 'cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartScreenInitialState());
  List<GetProductEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  getCart() async {
    emit(CartScreenLoadingStates(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) {
      emit(CartScreenErrorStates(errorMessage: l));
    }, (response) {
      productList = response.data?.products ?? [];
      emit(CartScreenSuccessStates(cartResponseEntity: response));
    });
  }

  deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteItemInCartErrorStates(errorMessage: l));
    }, (response) {
      emit(CartScreenSuccessStates(cartResponseEntity: response));
    });
  }

  updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      emit(UpdateCountInCartErrorStates(errorMessage: l));
    }, (response) {
      emit(CartScreenSuccessStates(cartResponseEntity: response));
    });
  }
}
