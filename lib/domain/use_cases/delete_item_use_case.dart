import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/repository/cart_repository_contract.dart';

class DeleteItemInCartUseCase {
  CartRepositoryContract repositoryContract;

  DeleteItemInCartUseCase({required this.repositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return repositoryContract.deleteItemInCart(productId);
  }
}
