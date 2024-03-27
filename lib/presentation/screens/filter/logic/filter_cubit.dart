import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/filter_real_estate_respone.dart';
import '../data/repo/filter_repo.dart';
import 'filter_state.dart';

class EstateFilterCubit extends Cubit<EstateFilterState> {
  final EstateFilterRepo _estateFilterRepo;

  EstateFilterCubit(this._estateFilterRepo)
      : super(const EstateFilterState.initial());

  void emitAllEstatesFilterStates({
    String? goal,
    int? stateId,
    int? cityId,
    int? priceFrom,
    int? priceTo,
    int? areaFrom,
    int? areaTo,
  }) async {
    emit(const EstateFilterState.loading());
    final response = await _estateFilterRepo.getFilteredRealEstates(
        goal: goal,
        stateId: stateId,
        cityId: cityId,
        priceFrom: priceFrom,
        priceTo: priceTo,
        areaFrom: areaFrom,
        areaTo: areaTo);
    response.when(
        success: (List<FilterRealEstateResponse> filterRealEstatesResponse) {
      emit(EstateFilterState.success(filterRealEstatesResponse));
    }, failure: (error) {
      emit(EstateFilterState.error(error: error.apiErrorModel.message!));
    });
  }
}
