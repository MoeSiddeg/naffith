import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/profile/data/models/get_faal_response.dart';
part 'get_faal_state.freezed.dart';

@freezed
abstract class GetFaalStates<T> with _$GetFaalStates<T> {
  const factory GetFaalStates.initial() = _Initial;

  const factory GetFaalStates.loading() = Loading;
  const factory GetFaalStates.success(GetFaalResponseBody data) = Success<T>;
  const factory GetFaalStates.error({required String error}) = Error;
}