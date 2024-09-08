import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/api_manager.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/AddToWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/ProductResponseEntity.dart';
import '../../../domain/entities/CategoryEntity.dart';
import '../../../domain/repository/data_sources/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getCategories();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response);
    });
  }
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await apiManager.getBrands();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage,));
    }, (response) {
      return Right(response);
    });
  }
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await apiManager.getProducts();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response);
    });
  }
  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(
      String productId) async {
    var either = await apiManager.addToWishList(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response);
    });
  }


}
