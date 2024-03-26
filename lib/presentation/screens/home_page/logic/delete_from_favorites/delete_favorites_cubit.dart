import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/home_page/data/models/favorites/add_to_favorites_response.dart';
import 'package:naffith/presentation/screens/home_page/logic/delete_from_favorites/delete_favorites_state.dart';

import 'package:naffith/presentation/screens/profile/logic/delete_faal_states.dart';

import '../../data/repos/all_real_estates_repo.dart';

class DeleteFavoritesCubit extends Cubit<DeleteFavoritesState> {
  final AllRealEstatesRepo _allRealEstatesRepo;

  DeleteFavoritesCubit(this._allRealEstatesRepo)
      : super(const DeleteFavoritesState.initial());

  void emitDeleteFavoritesStates({required String id}) async {
    emit( DeleteFavoritesState.loading());
    final response = await _allRealEstatesRepo.deleteFromFavorite(id: id);
    response.when(success: (success) {
      emit( DeleteFavoritesState.success());
    }, failure: (error) {
      emit(DeleteFavoritesState.error(error: error.apiErrorModel.message!));
    });
  }
}
