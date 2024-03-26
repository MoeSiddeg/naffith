import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_status_state.freezed.dart';

@freezed
abstract class ChangeStatusStates<T> with _$ChangeStatusStates<T> {
  const factory ChangeStatusStates.initial() = _Initial;

  const factory ChangeStatusStates.loading() = Loading;
  const factory ChangeStatusStates.success() = Success;
  const factory ChangeStatusStates.error({required String error}) = Error;
}