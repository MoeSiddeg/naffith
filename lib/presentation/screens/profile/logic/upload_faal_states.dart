import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/upload_faal_response.dart';

part 'upload_faal_states.freezed.dart';

@freezed
abstract class UploadFaalStates<T> with _$UploadFaalStates<T> {
  const factory UploadFaalStates.initial() = _Initial;

  const factory UploadFaalStates.loading() = Loading;
  const factory UploadFaalStates.success(UploadFaalResponseBody data) = Success<T>;
  const factory UploadFaalStates.error({required String error}) = Error;
}