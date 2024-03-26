import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/profile/logic/upload_faal_states.dart';
import '../data/repo/upload_faal_repo.dart';

class UploadFaalCubit extends Cubit<UploadFaalStates> {
  final FileRepository _uploadFaalRepo;
  UploadFaalCubit(this._uploadFaalRepo) : super(const UploadFaalStates.initial());
  void emitUploadFaalStates(FilePickerResult pdf) async {
    emit(const UploadFaalStates.loading());
    final response = await _uploadFaalRepo.uploadPdf(pdf);
    response.when(success: (uploadFaalResponse) {
      emit(UploadFaalStates.success(uploadFaalResponse));
    },  failure: (error) {
      emit(UploadFaalStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }

}