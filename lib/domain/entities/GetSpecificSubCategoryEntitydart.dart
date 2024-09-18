class GetSpecificSubCategoryEntity {
  GetSpecificSubCategoryEntity({
      this.data,
  this.message});

  List<DataSpecificSubCategoryEntity>? data;
  String? message;


}

class DataSpecificSubCategoryEntity {
  DataSpecificSubCategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
  int? v;


}