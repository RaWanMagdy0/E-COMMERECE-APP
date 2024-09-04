import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/api_manager.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/data_sources/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, code: hashCode));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, code: hashCode));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await apiManager.updateCountInCart(productId, count);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, code: hashCode));
    }, (response) {
      return Right(response);
    });
  }
}
