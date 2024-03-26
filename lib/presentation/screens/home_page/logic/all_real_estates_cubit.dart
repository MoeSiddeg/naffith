import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/all_real_estates_response_body.dart';
import '../data/repos/all_real_estates_repo.dart';
import 'all_real_estates_states.dart';

class AllRealEstatesCubit extends Cubit<AllRealEstateStates> {
  final AllRealEstatesRepo _allRealEstatesRepo;

  AllRealEstatesCubit(this._allRealEstatesRepo)
      : super(const AllRealEstateStates.initial());
  void emitAllRealEstateStates(
     ) async {
    emit(const AllRealEstateStates.loading());
    final response = await _allRealEstatesRepo.allRealEstatesSale();
    response.when(success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
      emit(AllRealEstateStates.success(allRealEstatesResponseBody));
    }, failure: (error) {
      emit(AllRealEstateStates.error(error: error.apiErrorModel.message!));
    });
  }

}