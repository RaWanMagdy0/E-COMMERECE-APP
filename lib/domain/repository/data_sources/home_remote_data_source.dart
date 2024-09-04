import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/ProductResponseEntity.dart';

import '../../entities/AddToCartResponseEntity.dart';
import '../../entities/CategoryEntity.dart';
import '../../entities/GetMensCategoryResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(
      String productId);

  Future<Either<Failures, GetMenCategoryResponseEntity>> getMenCategory();
}

abstract class HomeLocalDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(
      String productId);

  Future<Either<Failures, GetMenCategoryResponseEntity>> getMenCategory();
}
