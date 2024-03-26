import 'package:freezed_annotation/freezed_annotation.dart';
part 'hide_real_estate_state.freezed.dart';

@freezed
abstract class HideRealEstateStates<T> with _$HideRealEstateStates<T> {
  const factory HideRealEstateStates.initial() = _Initial;

  const factory HideRealEstateStates.loading() = Loading;
  const factory HideRealEstateStates.success() = Success;
  const factory HideRealEstateStates.error({required String error}) = Error;
}