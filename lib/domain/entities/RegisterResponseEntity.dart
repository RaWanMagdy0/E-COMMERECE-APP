import '../../data/model/response/UserDto.dart';

class RegisterResponseDto {
  RegisterResponseDto({
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
