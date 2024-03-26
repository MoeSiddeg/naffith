import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/change_to_sale_repo.dart';
import 'change_to_sale_state.dart';


class ChangeToSaleCubit extends Cubit<ChangeToSaleStates> {
  final ChangeToSaleRepo _changeToSaleRepo;

  ChangeToSaleCubit(this._changeToSaleRepo)
      : super(const ChangeToSaleStates.initial());

  void emitChangeToSaleStates(String? id ) async {
    emit(const ChangeToSaleStates.loading());
    final response = await _changeToSaleRepo.changeToSale(id!);
    response.when(success: (response) {
      emit(const ChangeToSaleStates.success());
    }, failure: (error) {
      emit(ChangeToSaleStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}