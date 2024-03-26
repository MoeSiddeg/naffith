import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_faal_states.freezed.dart';

@freezed
abstract class DeleteFaalStates<T> with _$DeleteFaalStates<T> {
  const factory DeleteFaalStates.initial() = _Initial;

  const factory DeleteFaalStates.loading() = Loading;
  const factory DeleteFaalStates.success() = Success;
  const factory DeleteFaalStates.error({required String error}) = Error;
}