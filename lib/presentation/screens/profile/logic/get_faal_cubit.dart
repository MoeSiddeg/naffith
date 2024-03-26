import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/profile/logic/get_faal_state.dart';
import '../data/repo/get_faal_repo.dart';

class GetFaalCubit extends Cubit<GetFaalStates> {
  final GetFaalRepo _getFaalRepo;

  GetFaalCubit(this._getFaalRepo)
      : super(const GetFaalStates.initial());
  bool isHaveFaal = false;
  void emitGetFaalStates() async {
    emit(const GetFaalStates.loading());
    final response = await _getFaalRepo.getFaal();
    response.when(success: (getFaalResponse) {
      emit( GetFaalStates.success(getFaalResponse));
      isHaveFaal = true;
    }, failure: (error) {
      emit(GetFaalStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}