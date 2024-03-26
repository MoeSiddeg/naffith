import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_faal_states.freezed.dart';

@freezed
abstract class UpdateFaalStates<T> with _$UpdateFaalStates<T> {
  const factory UpdateFaalStates.initial() = _Initial;

  const factory UpdateFaalStates.loading() = Loading;
  const factory UpdateFaalStates.success() = Success;
  const factory UpdateFaalStates.error({required String error}) = Error;
}