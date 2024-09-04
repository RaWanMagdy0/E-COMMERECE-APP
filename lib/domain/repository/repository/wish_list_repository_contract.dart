import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';

abstract class WishListRepositoryContract {
  Future<Either<Failures, GetWishListResponseEntity>> getWishList();
}
