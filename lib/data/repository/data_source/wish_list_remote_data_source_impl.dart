import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/api_manager.dart';

import 'package:e_comerence_app/data/api/failures.dart';

import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';

import '../../../domain/repository/data_sources/wish_list_remote_data_source.dart';

class WishListRemoteDataSourceImpl implements WishListRemoteDataSource {
  ApiManager apiManager;

  WishListRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getWishList() async {
    var either = await apiManager.getWishList();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, code: hashCode));
    }, (response) {
      return Right(response);
    });
  }
}
