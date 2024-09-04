import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/AddToWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';
import 'package:e_comerence_app/domain/entities/GetMensCategoryResponseEntity.dart';
import 'package:e_comerence_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/data_sources/home_remote_data_source.dart';
import 'package:e_comerence_app/domain/repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) {
    return remoteDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, AddToWishListResponseEntity>> addToWishList(
      String productId) {
    return remoteDataSource.addToWishList(productId);
  }

  @override
  Future<Either<Failures, GetMenCategoryResponseEntity>> getMenCategory() {
    return remoteDataSource.getMenCategory();
  }
}
