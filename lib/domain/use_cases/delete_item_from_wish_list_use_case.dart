import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/repository/wish_list_repository_contract.dart';

import '../../data/api/failures.dart';

class DeleteItemFromWishListUseCase {
  WishListRepositoryContract repositoryContract;
  DeleteItemFromWishListUseCase({required this.repositoryContract});

  Future<Either<Failures, GetWishListResponseEntity>> invoke(String productId) {
    return repositoryContract.deleteItemInWishList(productId);
  }
}
