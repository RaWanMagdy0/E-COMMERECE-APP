import 'package:e_comerence_app/domain/entities/UserEntity.dart';

class UserDto {
  UserDto({
    this.name,
    this.email,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }

  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(
      email: email,
      name: name,
    );
  }
}
