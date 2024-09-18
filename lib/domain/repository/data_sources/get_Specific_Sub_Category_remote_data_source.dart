import 'package:dartz/dartz.dart';
import 'package:e_comerence_app/data/api/failures.dart';

import '../../entities/GetSpecificSubCategoryEntitydart.dart';

abstract class GetSpecificSubCategoryRemoteDataSource{
  Future<Either<Failures,GetSpecificSubCategoryEntity>>getSpecificSubCategory();

}