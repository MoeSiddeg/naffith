import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/common/cities/data/models/cities_response.dart';
import 'package:naffith/common/cities/data/repo/cities_repo.dart';
import 'package:naffith/common/cities/logic/cities_states.dart';

class CitiesCubit extends Cubit<CitiesStates> {
  final CitiesRepo _categoryRepo;

  CitiesCubit(this._categoryRepo) : super(const CitiesStates.initial());
  List<Data> stateList = [];// Store the users list here
  List<String> stateNames = [] ;
  int id = 0;
  void emitCitiesListStates(String id) async {
    emit( CitiesStates.loading());
    stateNames = [] ;
    final response = await _categoryRepo.getCitiesList(id);
    response.when(success: (CitiesResponseBody stateResponse) {
      emit(CitiesStates.success(stateResponse));
      stateList = stateResponse.data.cities!
          .map((item) => Data(id: item.id, name: item.name))
          .toList();
       stateNames = stateList.map((item) => item.name).toList();
    }, failure: (error) {
      emit(CitiesStates.error(error: error.apiErrorModel.message!));
    });
  }
  void getCityID({required String? name}){
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
