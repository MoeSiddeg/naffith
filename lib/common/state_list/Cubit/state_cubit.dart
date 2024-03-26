import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/cities/logic/cities_cubit.dart';
import '../data/models/state_response.dart';

import '../data/repo/state_repo.dart';
import 'state_states.dart';

class StateCubit extends Cubit<StateStates> {
  final StateRepo _categoryRepo;

  StateCubit(this._categoryRepo) : super(const StateStates.initial());
  List<Data> stateList = [];// Store the users list here
  List<String> stateNames = [] ;
  int id = 0;
  void emitCategoryStates() async {
    final response = await _categoryRepo.getStateList();
    response.when(success: (StateResponse stateResponse) {
      emit(StateStates.success(stateResponse));
      stateList = stateResponse.data!
          .map((item) => Data(id: item.id, name: item.name))
          .toList();
       stateNames = stateList.map((item) => item.name).toList();
    }, failure: (error) {
      emit(StateStates.error(error: error.apiErrorModel.message!));
    });
  }
  void getStateID({required String? name}){
    int index = stateNames.indexOf(name!);
    final List<int> ids = stateList.map((item) => item.id).toList();
    if (index != -1) {
      int correspondingId = ids[index];
      id = correspondingId;
      print('The id for name is $correspondingId');
      print(id);

    } else {
      print('not found in the list');
    }
  }
}
