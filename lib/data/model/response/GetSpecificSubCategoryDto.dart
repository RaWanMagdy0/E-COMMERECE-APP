import 'package:e_comerence_app/domain/entities/GetSpecificSubCategoryEntitydart.dart';

class GetSpecificSubCategoryDto extends GetSpecificSubCategoryEntity {
  GetSpecificSubCategoryDto({super.data, super.message});

  GetSpecificSubCategoryDto.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataSpecificSubCategoryDto.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class DataSpecificSubCategoryDto extends DataSpecificSubCategoryEntity {
  DataSpecificSubCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  DataSpecificSubCategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
