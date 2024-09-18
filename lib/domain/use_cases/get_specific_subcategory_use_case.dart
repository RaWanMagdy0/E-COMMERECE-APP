import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/repository/repository/getSpecificSubCategoryRepositryContract.dart';

import '../entities/GetSpecificSubCategoryEntitydart.dart';

class GetSpecificSubCategoryUseCase{
  GetSpecificSubCategoryRepositoryContract repositoryContract;
  GetSpecificSubCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, GetSpecificSubCategoryEntity>> invoke() {
    return repositoryContract.getSpecificSubCategory();
  }
}
