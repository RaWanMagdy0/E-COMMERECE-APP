class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.data,
  });

  String? status;
  String? message;
  int? numOfCartItems;
  DataCartEntity? data;
}

class DataCartEntity {
  DataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<ProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class ProductsCartEntity {
  ProductsCartEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  String? product;
  int? price;
}
