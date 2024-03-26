import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/models/my_real_estates_model.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/repo/my_real_estates_repo.dart';
import 'package:naffith/presentation/screens/my_advertisements/logic/my_real_estates_states.dart';

class MyRealEstatesCubit extends Cubit<MyRealEstatesStates> {
  final MyRealEstatesRepo _myRealEstatesRep;

  MyRealEstatesCubit(this._myRealEstatesRep)
      : super(const MyRealEstatesStates.initial());
  void emitMyRealEstatesBuyStates(
      ) async {
    emit(const MyRealEstatesStates.loading());
    final response = await _myRealEstatesRep.myRealEstatesBuy();
    response.when(success: (MyRealEstatesResponse myRealEstatesRespones) {
      emit(MyRealEstatesStates.success(myRealEstatesRespones));
    }, failure: (error) {
      emit(MyRealEstatesStates.error(error: error.apiErrorModel.message!));
    });
  }

}