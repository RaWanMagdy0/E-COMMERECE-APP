import 'package:dartz/dartz.dart';
import '../../data/api/failures.dart';
import '../entities/ProductResponseEntity.dart';
import '../repository/repository/home_repository_contract.dart';

class GetAllProductsUseCase {
  HomeRepositoryContract repositoryContract;

  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repositoryContract.getAllProducts();
  }
}
