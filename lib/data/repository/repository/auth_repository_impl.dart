import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/data/model/response/RegisterResponseDto.dart';
import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';
import 'package:e_comerence_app/domain/repository/data_sources/auth_remot_data_source.dart';
import 'package:e_comerence_app/domain/repository/repository/auth_repository_Contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String repassword, String phone) {
    return remoteDataSource.register(name, email, password, repassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
