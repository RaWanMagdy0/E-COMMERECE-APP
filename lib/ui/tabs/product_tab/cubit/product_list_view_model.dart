import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/ui/tabs/product_tab/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/use_cases/addToCartUseCase.dart';
import '../../../../domain/use_cases/addToWishListUseCase.dart';
import '../../../../domain/use_cases/get_all_product_use_case.dart';

class ProductListViewModel extends Cubit<ProductListTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  AddToWishListUseCase addToWishListUseCase;

  ProductListViewModel(
      {required this.getAllProductsUseCase,
      required this.addToCartUseCase,
      required this.addToWishListUseCase})
      : super(ProductListTabInitialState());
  List<ProductEntity> productList = [];
  List<String> wishList = [];
  int numOfCartItems = 0;

  void getProducts() async {
    emit(ProductListTabLoadingState(loadingMessage: "Loading..."));
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductListTabErrorState(errors: error));
    }, (response) {
      productList = response.data ?? [];
      emit(ProductListTabSuccessState(productResponseEntity: response));
    });
  }

  static ProductListViewModel get(context) => BlocProvider.of(context);

  void addToCart(String productId) async {
    emit(AddToCartLoadingStates(loadingMessage: "Loading..."));
    try {
      var either = await addToCartUseCase.invoke(productId);
      either.fold((error) {
        print("Add to Cart Error: ${error.toString()}");
        emit(AddToCartErrorStates(errors: error));
      }, (response) {
        print("Add to Cart Success: ${response.toString()}");
        numOfCartItems = response.numOfCartItems ?? 0;
        print("Num Of Cart items : $numOfCartItems");
        emit(AddToCartSuccessStates(responseEntity: response));
      });
    } catch (error) {
      emit(AddToCartErrorStates(
          errors: Failures(errorMessage: error.toString(),)));
    }
  }

  void addToWishList(String productId) async {
    emit(AddToWishListLoadingStates(loadingMessage: "Loading..."));
    var either = await addToWishListUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToWishListErrorStates(error: error));
    }, (response) {
      wishList = response.data ?? [];
      emit(AddToWishListSuccessStates(responseEntity: response));
    });
  }
}
