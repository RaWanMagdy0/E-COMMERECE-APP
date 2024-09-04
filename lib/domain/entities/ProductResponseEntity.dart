import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.data,
  });

  int? results;
  List<ProductEntity>? data;
}

class ProductEntity {
  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
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
    this.id,
  });

  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
}

class BrandEntity {
  BrandEntity({
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

class SubcategoryEntity {
  SubcategoryEntity({
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

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;
}
