import 'package:e_comerence_app/domain/entities/GetMensCategoryResponseEntity.dart';

class GetMenCategoryResponseDto extends GetMenCategoryResponseEntity {
  GetMenCategoryResponseDto({super.data, this.message});

  String? message;

  GetMenCategoryResponseDto.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null
        ? DataMensResponseDto.fromJson(json['data'])
        : null;
  }
}

class DataMensResponseDto extends DataMensResponseEntity {
  DataMensResponseDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  DataMensResponseDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
