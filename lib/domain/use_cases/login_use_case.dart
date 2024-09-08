import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/di.dart';
import '../../data/api/failures.dart';
import '../entities/auth_result_entity.dart';
import '../repository/repository/auth_repository_Contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response);
    });
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}
