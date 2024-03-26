import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/category/data/models/category_response_body.dart';
import '../data/repo/category_repo.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  final CategoryRepo _categoryRepo;

  CategoryCubit(this._categoryRepo) : super(const CategoryStates.initial());
  List<CategoryData> categoryList = [];// Store the users list here
  List<String> names = [] ;
  int id = 0;
  void emitCategoryStates() async {
    final response = await _categoryRepo.getCategoryList();
    response.when(success: (CategoryResponseBody categoryResonseBody) {
      emit(CategoryStates.success(categoryResonseBody));
      categoryList = categoryResonseBody.data
          .map((item) => CategoryData(id: item.id, name: item.name))
          .toList();
       names = categoryList.map((item) => item.name).toList();


    }, failure: (error) {
      emit(CategoryStates.error(error: error.apiErrorModel.message!));
    });
  }
  void getCategoryID({required String? name}){
    int index = names.indexOf(name!);
    final List<int> ids = categoryList.map((item) => item.id).toList();
    if (index != -1) {
      int correspondingId = ids[index];
      id = correspondingId;
      print('The id for name is $correspondingId');
      print(id);
    } else {
      print('not found in the list');
    }
  }
}
