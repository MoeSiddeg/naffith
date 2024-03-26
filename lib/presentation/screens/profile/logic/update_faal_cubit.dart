import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/profile/data/models/update_faal_request.dart';
import 'package:naffith/presentation/screens/profile/logic/update_faal_states.dart';
import '../data/repo/update_faal_repo.dart';

class UpdateFaalCubit extends Cubit<UpdateFaalStates> {
  final UpdateFaalRepo _updateFaalRepo;
  UpdateFaalCubit(this._updateFaalRepo) : super(const UpdateFaalStates.initial());
  void emitUpdateFaalStates(FilePickerResult pdf, UpdateFaalRequest updateFaalRequest) async {
    emit(const UpdateFaalStates.loading());
    final response = await _updateFaalRepo.updateFaal(pdf, updateFaalRequest);
    response.when(success: (uploadFaalResponse) {
      emit(UpdateFaalStates.success());
    },  failure: (error) {
      emit(UpdateFaalStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }

}