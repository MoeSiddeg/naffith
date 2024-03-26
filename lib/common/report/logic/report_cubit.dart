import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/report/data/repo/report_repo.dart';
import 'package:naffith/common/report/logic/report_state.dart';

class ReportRealEstatesCubit extends Cubit<ReportRealEstateState> {
  final ReportRealEstatesRepo _reportRealEstatesRepo;
  ReportRealEstatesCubit(this._reportRealEstatesRepo) : super(const ReportRealEstateState.initial());

  void emitAddRealEstateStates({ required String text , required String real_estate_id,required String type}) async {
    emit( ReportRealEstateState.loading());
    final response = await _reportRealEstatesRepo.reportRealEstates(text: text, real_estate_id: real_estate_id, type: type);
    response.when(success: (addRealEstatesResponseBody) {
      emit(ReportRealEstateState.success(addRealEstatesResponseBody));
    }, failure: (error) {
      emit(ReportRealEstateState.error(error: error.apiErrorModel.message!));
    });
  }

}