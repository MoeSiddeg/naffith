import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/common/cities/data/models/cities_response.dart';


part 'cities_states.freezed.dart';

@freezed
abstract class CitiesStates<T> with _$CitiesStates<T> {
  const factory CitiesStates.initial() = _Initial;
  const factory CitiesStates.loading() = Loading;
  const factory CitiesStates.success(CitiesResponseBody data) = Success<T>;
  const factory CitiesStates.error({required String error}) = Error;
}