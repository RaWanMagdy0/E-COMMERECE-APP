import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';

import '../repository/repository/home_repository_contract.dart';

class GetAllCategoriesUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllCategoriesUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getAllCategories();
  }
}
