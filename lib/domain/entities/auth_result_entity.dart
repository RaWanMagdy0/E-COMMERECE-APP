import 'package:e_comerence_app/domain/entities/UserEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;

  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
