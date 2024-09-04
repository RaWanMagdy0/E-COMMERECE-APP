import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
