import 'package:dartz/dartz.dart';

import '../../../data/api/failures.dart';
import '../../entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
