import 'package:e_comerence_app/domain/entities/GetWishListResponseEntity.dart';

class GetWishListResponseDto extends GetWishListResponseEntity {
  GetWishListResponseDto({super.status, super.count, super.data, this.message});

  String? message;

  GetWishListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataResponseDto.fromJson(v));
      });
    }
  }
}

class DataResponseDto extends DataResponseEntity {
  DataResponseDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  DataResponseDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryResponseDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryResponseDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? BrandResponseDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class BrandResponseDto extends BrandResponseEntity {
  BrandResponseDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  BrandResponseDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  CategoryResponseDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class SubcategoryResponseDto extends SubcategoryResponseEntity {
  SubcategoryResponseDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryResponseDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
