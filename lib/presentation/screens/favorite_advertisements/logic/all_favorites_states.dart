import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';

import '../data/models/all_favorites_response.dart';

part 'all_favorites_states.freezed.dart';

@freezed
class AllFavoritesStates<T> with _$AllFavoritesStates<T> {
  const factory AllFavoritesStates.initial() = _Initial;
  const factory AllFavoritesStates.loading() = Loading;
  const factory AllFavoritesStates.success(AllRealEstatesResponseBody data) = Success<T>;
  const factory AllFavoritesStates.error({required String error}) = Error;
}