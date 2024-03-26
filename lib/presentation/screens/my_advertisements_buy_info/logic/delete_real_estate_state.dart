import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_real_estate_state.freezed.dart';

@freezed
abstract class DeleteRealEstateState<T> with _$DeleteRealEstateState<T> {
  const factory DeleteRealEstateState.initial() = _Initial;

  const factory DeleteRealEstateState.loading() = Loading;
  const factory DeleteRealEstateState.success() = Success;
  const factory DeleteRealEstateState.error({required String error}) = Error;
}