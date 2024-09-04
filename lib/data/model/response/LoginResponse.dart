import '../../../domain/entities/auth_result_entity.dart';
import 'UserDto.dart';

class LoginResponse {
  LoginResponse(
      {this.message, this.user, this.token, this.error, this.statusMsg});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
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
