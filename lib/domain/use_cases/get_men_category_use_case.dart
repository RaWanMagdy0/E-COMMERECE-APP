import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/GetMensCategoryResponseEntity.dart';
import 'package:e_comerence_app/domain/repository/repository/home_repository_contract.dart';

class GetMenCategoryUseCase {
  HomeRepositoryContract repositoryContract;

  GetMenCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, GetMenCategoryResponseEntity>> invoke() {
    return repositoryContract.getMenCategory();
  }
}
