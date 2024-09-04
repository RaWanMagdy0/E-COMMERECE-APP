import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';
import 'package:e_comerence_app/domain/repository/repository/auth_repository_Contract.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
