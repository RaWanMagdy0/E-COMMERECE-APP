import 'package:e_comerence_app/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? DataCartDto.fromJson(json['data']) : null;
  }
}

class DataCartDto extends DataCartEntity {
  DataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class ProductsCartDto extends ProductsCartEntity {
  ProductsCartDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  ProductsCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
