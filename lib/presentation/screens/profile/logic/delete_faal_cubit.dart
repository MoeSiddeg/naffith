import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/update_faal_request.dart';
import '../data/repo/delete_faal_repo.dart';
import 'delete_faal_states.dart';

class DeleteFaalCubit extends Cubit<DeleteFaalStates> {
  final DeleteFaalRepo _deleteFaalRepo;

  DeleteFaalCubit(this._deleteFaalRepo)
      : super(const DeleteFaalStates.initial());

  void emitDeleteFaalStates(UpdateFaalRequest updateFaalRequest) async {
    emit(const DeleteFaalStates.loading());
    final response = await _deleteFaalRepo.updateFaal(updateFaalRequest);
    response.when(success: (uploadFaalResponse) {
      emit(DeleteFaalStates.success());

    }, failure: (error) {
      emit(DeleteFaalStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
