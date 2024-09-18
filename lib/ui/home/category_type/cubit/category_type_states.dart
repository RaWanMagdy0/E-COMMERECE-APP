
import '../../../../data/api/failures.dart';
import '../../../../domain/entities/GetSpecificSubCategoryEntitydart.dart';

abstract class SpecificSupCategoryStates {}

class SpecificSupCategoryInitialState extends SpecificSupCategoryStates {}

class SpecificSupCategoryLoadingStates extends SpecificSupCategoryStates {
  String? loadingMessage;

  SpecificSupCategoryLoadingStates({required this.loadingMessage});
}

class SpecificSupCategoryErrorStates extends SpecificSupCategoryStates {
  Failures errorMessage;

  SpecificSupCategoryErrorStates({required this.errorMessage});
}

class SpecificSupCategorySuccessStates extends SpecificSupCategoryStates {
  GetSpecificSubCategoryEntity subCategoryEntity;

  SpecificSupCategorySuccessStates({required this.subCategoryEntity});
}
