import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/repository/home_repository_contract.dart';

class AddToWishListUseCase {
  HomeRepositoryContract repositoryContract;

  AddToWishListUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToWishListResponseEntity>> invoke(
      String productId) {
    return repositoryContract.addToWishList(productId);
  }
}
