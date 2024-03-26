import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/models/update_note_request_model.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/logic/update_note/update_note_state.dart';

import '../../data/repo/update_note_repo.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteStates> {
  final UpdateNoteRepo _updateNoteRepo;

  UpdateNoteCubit(this._updateNoteRepo)
      : super(const UpdateNoteStates.initial());

  void emitUpdateNoteStates(String? id ,String private_note) async {
    emit(const UpdateNoteStates.loading());
    final response = await _updateNoteRepo.updateNote(id!,private_note);
    response.when(success: (response) {
      emit(const UpdateNoteStates.success());
    }, failure: (error) {
      emit(UpdateNoteStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}