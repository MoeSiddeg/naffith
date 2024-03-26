import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_note_state.freezed.dart';

@freezed
abstract class UpdateNoteStates<T> with _$UpdateNoteStates<T> {
  const factory UpdateNoteStates.initial() = _Initial;

  const factory UpdateNoteStates.loading() = Loading;
  const factory UpdateNoteStates.success() = Success;
  const factory UpdateNoteStates.error({required String error}) = Error;
}