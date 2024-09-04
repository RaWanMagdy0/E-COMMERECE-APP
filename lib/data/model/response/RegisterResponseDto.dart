import 'package:e_comerence_app/domain/entities/auth_result_entity.dart';

import 'Errors.dart';
import 'UserDto.dart';

class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
    error = json['error'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity(),
    );
  }
}
