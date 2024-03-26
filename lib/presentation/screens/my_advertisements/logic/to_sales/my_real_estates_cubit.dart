import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/models/my_real_estates_model.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/repo/my_real_estates_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/to_sales/my_real_to_sale_states.dart';

class MyRealEstatesToSaleCubit extends Cubit<MyRealEstatesToSaleStates> {
  final MyRealEstatesRepo _myRealEstatesRep;

  MyRealEstatesToSaleCubit(this._myRealEstatesRep)
      : super(const MyRealEstatesToSaleStates.initial());
  void emitMyRealEstatesSalesStates(
      ) async {
    emit(const MyRealEstatesToSaleStates.loading());
    final response = await _myRealEstatesRep.myRealEstatesSales();
    response.when(success: (MyRealEstatesResponse myRealEstatesRespones) {
      emit(MyRealEstatesToSaleStates.success(myRealEstatesRespones));
    }, failure: (error) {
      emit(MyRealEstatesToSaleStates.error(error: error.apiErrorModel.message!));
    });
  }

}