import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/home_page/logic/all_real_estate/all_real_estates_list_states.dart';

import '../../data/models/all_real_estates_response_body.dart';
import '../../data/repos/all_real_estates_repo.dart';

class AllRealEstatesListCubit extends Cubit<AllRealEstateListStates> {
  final AllRealEstatesRepo _allRealEstatesRepo;

  AllRealEstatesListCubit(this._allRealEstatesRepo)
      : super(const AllRealEstateListStates.initial());
  void emitAllRealEstateListStates(
     ) async {
    emit(const AllRealEstateListStates.loading());
    final response = await _allRealEstatesRepo.allRealEstatesList();
    response.when(success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
      emit(AllRealEstateListStates.success(allRealEstatesResponseBody));
    }, failure: (error) {
      emit(AllRealEstateListStates.error(error: error.apiErrorModel.message!));
    });
  }

}