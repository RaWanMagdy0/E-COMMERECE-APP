import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/data_sources/wish_list_remote_data_source.dart';
import 'package:e_comerence_app/domain/repository/repository/wish_list_repository_contract.dart';

class WishListRepositoryImpl implements WishListRepositoryContract {
  WishListRemoteDataSource wishListRemoteDataSource;

  WishListRepositoryImpl({required this.wishListRemoteDataSource});

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getWishList() {
    return wishListRemoteDataSource.getWishList();
  }

  @override
  Future<Either<Failures, GetWishListResponseEntity>> deleteItemInWishList(String productId) {
    return wishListRemoteDataSource.deleteItemInWishList(productId);
  }
}
