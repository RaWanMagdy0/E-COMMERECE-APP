import 'package:e_comerence_app/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_comerence_app/data/repository/data_source/cart_remote_data_source_impl.dart';
import 'package:e_comerence_app/data/repository/data_source/home_remote_data_source_Impl.dart';
import 'package:e_comerence_app/data/repository/data_source/wish_list_remote_data_source_impl.dart';
import 'package:e_comerence_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_comerence_app/data/repository/repository/cart_repository_impl.dart';
import 'package:e_comerence_app/data/repository/repository/home_repository_impl.dart';
import 'package:e_comerence_app/data/repository/repository/wish_list_repository_impl.dart';
import 'package:e_comerence_app/domain/repository/data_sources/auth_remot_data_source.dart';
import 'package:e_comerence_app/domain/repository/data_sources/cart_remote_data_source.dart';
import 'package:e_comerence_app/domain/repository/data_sources/home_remote_data_source.dart';
import 'package:e_comerence_app/domain/repository/repository/cart_repository_contract.dart';
import 'package:e_comerence_app/domain/repository/repository/home_repository_contract.dart';
import 'package:e_comerence_app/domain/use_cases/addToCartUseCase.dart';
import 'package:e_comerence_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_comerence_app/domain/use_cases/get_cart_use_case.dart';
import 'package:e_comerence_app/domain/use_cases/login_use_case.dart';
import 'package:e_comerence_app/domain/use_cases/register_use_case.dart';
import '../domain/repository/data_sources/wish_list_remote_data_source.dart';
import '../domain/repository/repository/wish_list_repository_contract.dart';
import '../domain/use_cases/addToWishListUseCase.dart';
import '../domain/use_cases/delete_item_use_case.dart';
import '../domain/use_cases/get_all_brands_use_case.dart';
import '../domain/use_cases/get_all_product_use_case.dart';
import '../domain/use_cases/get_wish_list_use_case.dart';
import '../domain/use_cases/update_count_in_cart_use_case.dart';
import 'api/api_manager.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepositoryImpl injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}

GetAllCategoriesUseCase injectGetAllCategoryUseCase() {
  return GetAllCategoriesUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(repositoryContract: injectHomeRepositoryContract());
}

AddToWishListUseCase injectAddToWishListUseCase() {
  return AddToWishListUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

DeleteItemInCartUseCase injectDeleteItemInCartUseCase() {
  return DeleteItemInCartUseCase(
      repositoryContract: injectCartRepositoryContract());
}

UpdateCountInCartUseCase injectUpdateCountInCartUseCase() {
  return UpdateCountInCartUseCase(
      repositoryContract: injectCartRepositoryContract());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(repositoryContract: injectCartRepositoryContract());
}

CartRepositoryContract injectCartRepositoryContract() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetWishListUseCase injectGetWishListUseCase() {
  return GetWishListUseCase(
      repositoryContract: (injectWishListRepositoryContract()));
}

WishListRepositoryContract injectWishListRepositoryContract() {
  return WishListRepositoryImpl(
      wishListRemoteDataSource: injectWishListRemoteDataSource());
}

WishListRemoteDataSource injectWishListRemoteDataSource() {
  return WishListRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
