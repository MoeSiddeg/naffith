import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/repo/change_status_repo.dart';
import 'change_status_state.dart';


class ChangeStatusCubit extends Cubit<ChangeStatusStates> {
  final ChangeStatusRepo _changeStatusRepo;

  ChangeStatusCubit(this._changeStatusRepo)
      : super(const ChangeStatusStates.initial());

  void emitChangeStatusStates(String? id ,String private_note) async {
    emit(const ChangeStatusStates.loading());
    final response = await _changeStatusRepo.changeStatus(id!,private_note);
    response.when(success: (response) {
      emit(const ChangeStatusStates.success());
    }, failure: (error) {
      emit(ChangeStatusStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}