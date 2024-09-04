class GetMenCategoryResponseEntity {
  GetMenCategoryResponseEntity({
    this.data,
  });

  DataMensResponseEntity? data;
}

class DataMensResponseEntity {
  DataMensResponseEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;
}
