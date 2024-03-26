import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/hide_real_estate_repo.dart';
import 'hide_real_estate_state.dart';

class HideRealEstateCubit extends Cubit<HideRealEstateStates> {
  final HideRealEstateRepo _hideRealEstateRepo;

  HideRealEstateCubit(this._hideRealEstateRepo)
      : super(const HideRealEstateStates.initial());

  void emitHideRealEstateStates(String? id) async {
    emit(const HideRealEstateStates.loading());
    final response = await _hideRealEstateRepo.hideRealEstate(id!);
    response.when(success: (response) {
      emit(const HideRealEstateStates.success());
    }, failure: (error) {
      emit(
          HideRealEstateStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
