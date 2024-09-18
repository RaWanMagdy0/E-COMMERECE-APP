import 'package:e_comerence_app/data/model/response/ProductResponseDto.dart';
import 'package:e_comerence_app/domain/entities/CategoryEntity.dart';
import 'package:e_comerence_app/domain/entities/ProductResponseEntity.dart';

/// status : "success"
/// numOfCartItems : 4
/// data : {"_id":"66c52af7ed0dc0016cd6c70f","cartOwner":"66bd5056ed0dc0016c64dcfb","products":[{"count":6,"_id":"66c5ea94ed0dc0016ce2a369","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"66c61163ed0dc0016ce5fba9","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c5b7dc1175abc65ca019","title":"Galaxy 6 Running Shoes","quantity":60,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393655068-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":5,"id":"6428c5b7dc1175abc65ca019"},"price":1629},{"count":2,"_id":"66c62752ed0dc0016ce7b139","product":{"subcategory":[{"_id":"6407f3ccb575d3b90bf957eb","name":"Cameras & Accessories","slug":"cameras-and-accessories","category":"6439d2d167d9aa4ca970649f"}],"_id":"6408e43a6406cd15828e8f22","title":"EOS M50 Mark II Mirrorless Digital Camera With 15-45mm Lens Black","quantity":600,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1678304313006-cover.jpeg","category":{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511121316.png"},"brand":{"_id":"64089fe824b25627a25315d1","name":"Canon","slug":"canon","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"},"ratingsAverage":4.3,"id":"6408e43a6406cd15828e8f22"},"price":19699},{"count":2,"_id":"66c65711ed0dc0016cec1c7e","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":170}],"createdAt":"2024-08-20T23:47:03.149Z","updatedAt":"2024-08-21T21:08:23.306Z","__v":14,"totalCartPrice":42261}

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.data,
  });

  String? status;
  int? numOfCartItems;
  GetDataEntity? data;
}

/// _id : "66c52af7ed0dc0016cd6c70f"
/// cartOwner : "66bd5056ed0dc0016c64dcfb"
/// products : [{"count":6,"_id":"66c5ea94ed0dc0016ce2a369","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"66c61163ed0dc0016ce5fba9","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c5b7dc1175abc65ca019","title":"Galaxy 6 Running Shoes","quantity":60,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393655068-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":5,"id":"6428c5b7dc1175abc65ca019"},"price":1629},{"count":2,"_id":"66c62752ed0dc0016ce7b139","product":{"subcategory":[{"_id":"6407f3ccb575d3b90bf957eb","name":"Cameras & Accessories","slug":"cameras-and-accessories","category":"6439d2d167d9aa4ca970649f"}],"_id":"6408e43a6406cd15828e8f22","title":"EOS M50 Mark II Mirrorless Digital Camera With 15-45mm Lens Black","quantity":600,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1678304313006-cover.jpeg","category":{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511121316.png"},"brand":{"_id":"64089fe824b25627a25315d1","name":"Canon","slug":"canon","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"},"ratingsAverage":4.3,"id":"6408e43a6406cd15828e8f22"},"price":19699},{"count":2,"_id":"66c65711ed0dc0016cec1c7e","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":170}]
/// createdAt : "2024-08-20T23:47:03.149Z"
/// updatedAt : "2024-08-21T21:08:23.306Z"
/// __v : 14
/// totalCartPrice : 42261

class GetDataEntity {
  GetDataEntity({
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
  List<GetProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

/// count : 6
/// _id : "66c5ea94ed0dc0016ce2a369"
/// product : {"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"}
/// price : 149

class GetProductEntity {
  GetProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  GetProductCartEntity? product;
  int? price;
}

/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// _id : "6428ead5dc1175abc65ca0ad"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// id : "6428ead5dc1175abc65ca0ad"

class GetProductCartEntity {
  GetProductCartEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  dynamic? ratingsAverage;
}

/// _id : "64089bbe24b25627a253158b"
/// name : "DeFacto"
/// slug : "defacto"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"
