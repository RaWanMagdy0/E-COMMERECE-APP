import '../../../domain/entities/AddToWishListResponseEntity.dart';

class AddToWishListResponseDto extends AddToWishListResponseEntity {
  AddToWishListResponseDto({
    super.status,
    super.message,
    super.data,
  });

  AddToWishListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
