import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/data/repo/all_favorites_repo.dart';
import 'package:naffith/presentation/screens/favorite_advertisements/logic/all_favorites_states.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';
import '../data/models/all_favorites_response.dart';

class AllFavoritesCubit extends Cubit<AllFavoritesStates> {
  final AllFavoritesRepo _allFavoritesRepo;

  AllFavoritesCubit(this._allFavoritesRepo)
      : super(const AllFavoritesStates.initial());
  void emitAllFavoritesStates(
      ) async {
    emit(const AllFavoritesStates.loading());
    final response = await _allFavoritesRepo.allFavorites();
    response.when(success: (AllRealEstatesResponseBody allRealEstatesResponseBody) {
      emit(AllFavoritesStates.success(allRealEstatesResponseBody));
    }, failure: (error) {
      emit(AllFavoritesStates.error(error: error.apiErrorModel.message!));
    });
  }

}