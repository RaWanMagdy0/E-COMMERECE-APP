import '../../data/model/response/UserDto.dart';

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.error,
    this.statusMsg,
    this.token,
  });

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;
}
