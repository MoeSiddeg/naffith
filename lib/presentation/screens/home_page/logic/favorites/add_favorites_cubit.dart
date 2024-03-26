import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/home_page/data/models/favorites/add_to_favorites_response.dart';
import 'package:naffith/presentation/screens/home_page/logic/favorites/add_favorites_state.dart';

import '../../data/repos/all_real_estates_repo.dart';

class AddFavoritesCubit extends Cubit<AddFavoritesState> {
  final AllRealEstatesRepo _allRealEstatesRepo;

  AddFavoritesCubit(this._allRealEstatesRepo)
      : super(const AddFavoritesState.initial());
  void emitAddFavoritesStates({ required String id}
      ) async {
    emit(const AddFavoritesState.loading());
    final response = await _allRealEstatesRepo.addToFavorites(id: id);
    response.when(success: (AddToFavoritesResponse addToFavoritesResponse) {
      emit(AddFavoritesState.success(addToFavoritesResponse));
    }, failure: (error) {
      emit(AddFavoritesState.error(error: error.apiErrorModel.message!));
    });
  }

}