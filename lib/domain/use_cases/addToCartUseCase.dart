import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/repository/home_repository_contract.dart';

class AddToCartUseCase {
  HomeRepositoryContract repositoryContract;

  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return repositoryContract.addToCart(productId);
  }
}
