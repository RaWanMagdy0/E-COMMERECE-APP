import '../../../../data/api/failures.dart';
import '../../../../domain/entities/GetCartResponseEntity.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class CartScreenLoadingStates extends CartScreenStates {
  String? loadingMessage;

  CartScreenLoadingStates({required this.loadingMessage});
}

class CartScreenErrorStates extends CartScreenStates {
  Failures errorMessage;

  CartScreenErrorStates({required this.errorMessage});
}

class CartScreenSuccessStates extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  CartScreenSuccessStates({required this.cartResponseEntity});
}

class DeleteItemInCartLoadingStates extends CartScreenStates {
  String? loadingMessage;

  DeleteItemInCartLoadingStates({required this.loadingMessage});
}

class DeleteItemInCartErrorStates extends CartScreenStates {
  Failures errorMessage;

  DeleteItemInCartErrorStates({required this.errorMessage});
}

class DeleteItemInCartSuccessStates extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  DeleteItemInCartSuccessStates({required this.cartResponseEntity});
}

class UpdateCountInCartLoadingStates extends CartScreenStates {
  String? loadingMessage;

  UpdateCountInCartLoadingStates({required this.loadingMessage});
}

class UpdateCountInCartErrorStates extends CartScreenStates {
  Failures errorMessage;

  UpdateCountInCartErrorStates({required this.errorMessage});
}

class UpdateCountInCartSuccessStates extends CartScreenStates {
  GetCartResponseEntity cartResponseEntity;

  UpdateCountInCartSuccessStates({required this.cartResponseEntity});
}
