


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/change_to_buy_repo.dart';
import 'change_to_buy_state.dart';

class ChangeToBuyCubit extends Cubit<ChangeToBuyStates> {
  final ChangeToBuyRepo _changeToBuyRepo;

  ChangeToBuyCubit(this._changeToBuyRepo)
      : super(const ChangeToBuyStates.initial());

  void emitChangeToBuyStates(String? id ) async {
    emit(const ChangeToBuyStates.loading());
    final response = await _changeToBuyRepo.changeToBuy(id!);
    response.when(success: (response) {
      emit(const ChangeToBuyStates.success());
    }, failure: (error) {
      emit(ChangeToBuyStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}