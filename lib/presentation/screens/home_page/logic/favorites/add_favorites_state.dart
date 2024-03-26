import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/home_page/data/models/favorites/add_to_favorites_response.dart';

part 'add_favorites_state.freezed.dart';

@freezed
class AddFavoritesState<T> with _$AddFavoritesState<T> {
  const factory AddFavoritesState.initial() = _Initial;
  const factory AddFavoritesState.loading() = Loading;
  const factory AddFavoritesState.success(AddToFavoritesResponse data) = Success<T>;
  const factory AddFavoritesState.error({required String error}) = Error;
}