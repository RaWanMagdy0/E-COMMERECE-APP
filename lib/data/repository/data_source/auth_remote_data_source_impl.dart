import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/api_manager.dart';
import 'package:e_comerence_app/data/api/failures.dart';
import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';
import 'package:e_comerence_app/domain/repository/data_sources/auth_remot_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((error) {
      return Left(
          Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(password, email);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage, ));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}
