import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';
import '../repository/repository/wish_list_repository_contract.dart';

class GetWishListUseCase {
  WishListRepositoryContract repositoryContract;

  GetWishListUseCase({required this.repositoryContract});

  Future<Either<Failures, GetWishListResponseEntity>> invoke() {
    return repositoryContract.getWishList();
  }
}
