import 'package:e_comerence_app/domain/entities/GetSpecificSubCategoryEntitydart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_cases/get_specific_subcategory_use_case.dart';
import 'category_type_states.dart';

class CategoryTypeViewModel extends Cubit<SpecificSupCategoryStates>{
  GetSpecificSubCategoryUseCase getSpecificSubCategoryUseCase;
  CategoryTypeViewModel({required this.getSpecificSubCategoryUseCase}):
        super(SpecificSupCategoryInitialState());
  List<DataSpecificSubCategoryEntity> CategoryList = [];


  getSpecificSubCategory() async {
    emit(SpecificSupCategoryLoadingStates(loadingMessage: 'Loading...'));
    var either = await getSpecificSubCategoryUseCase.invoke();
    either.fold((l) {
      emit(SpecificSupCategoryErrorStates(errorMessage: l));
    }, (response) {
      CategoryList = response.data??[];

      emit(SpecificSupCategorySuccessStates( subCategoryEntity: response));
    });
  }
}