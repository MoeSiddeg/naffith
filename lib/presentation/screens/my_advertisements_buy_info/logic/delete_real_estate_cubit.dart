

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/delete_real_estate_repo.dart';

import '../../profile/data/models/update_faal_request.dart';
import 'delete_real_estate_state.dart';

class DeleteRealEstateCubit extends Cubit<DeleteRealEstateState> {
  final DeleteRealEstateRepo _deleteFaalRepo;

  DeleteRealEstateCubit(this._deleteFaalRepo)
      : super(const DeleteRealEstateState.initial());

  void emitDeleteRealEstateStates(String? id ) async {
    emit(const DeleteRealEstateState.loading());
    final response = await _deleteFaalRepo.deleteRealEstate(id!);
    response.when(success: (uploadFaalResponse) {
      emit(DeleteRealEstateState.success());
    }, failure: (error) {
      emit(DeleteRealEstateState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
