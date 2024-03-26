import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/all_real_estates_response_body.dart';
import '../../data/repos/all_real_estates_repo.dart';
import 'all_real_estates_buy_states.dart';


class AllRealEstatesBuyCubit extends Cubit<AllRealEstateBuyStates> {
  final AllRealEstatesRepo _allRealEstatesRepo;

  AllRealEstatesBuyCubit(this._allRealEstatesRepo)
      : super(const AllRealEstateBuyStates.initial());
  void emitAllRealEstateBuyStates(
     ) async {
    emit(const AllRealEstateBuyStates.loading());
    final response = await _allRealEstatesRepo.allRealEstatesBuy();
    response.when(success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
      emit(AllRealEstateBuyStates.success(allRealEstatesResponseBody));
    }, failure: (error) {
      emit(AllRealEstateBuyStates.error(error: error.apiErrorModel.message!));
    });
  }

}