import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_favorites_state.freezed.dart';

@freezed
class DeleteFavoritesState<T> with _$DeleteFavoritesState<T> {
  const factory DeleteFavoritesState.initial() = _Initial;
  const factory DeleteFavoritesState.loading() = Loading;
  const factory DeleteFavoritesState.success() = Success;
  const factory DeleteFavoritesState.error({required String error}) = Error;
}