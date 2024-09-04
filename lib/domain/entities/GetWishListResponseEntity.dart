class GetWishListResponseEntity {
  GetWishListResponseEntity({
    this.status,
    this.count,
    this.data,
  });

  String? status;
  int? count;
  List<DataResponseEntity>? data;
}

class DataResponseEntity {
  DataResponseEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int? sold;
  List<String>? images;
  List<SubcategoryResponseEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryResponseEntity? category;
  BrandResponseEntity? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
}

class BrandResponseEntity {
  BrandResponseEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class CategoryResponseEntity {
  CategoryResponseEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class SubcategoryResponseEntity {
  SubcategoryResponseEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}
