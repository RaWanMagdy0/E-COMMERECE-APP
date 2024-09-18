import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/domain/repository/data_sources/get_Specific_Sub_Category_remote_data_source.dart';

import '../../../domain/entities/GetSpecificSubCategoryEntitydart.dart';
import '../../api/api_manager.dart';
import '../../api/failures.dart';

class GetSpecificSubCategoryDataSourceImpl implements GetSpecificSubCategoryRemoteDataSource {
  ApiManager apiManager;

  GetSpecificSubCategoryDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetSpecificSubCategoryEntity>> getSpecificSubCategory()async {
    var either = await apiManager.getSpecificSubCategory();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage,));
    }, (response) {
      return Right(response);
    });
}}