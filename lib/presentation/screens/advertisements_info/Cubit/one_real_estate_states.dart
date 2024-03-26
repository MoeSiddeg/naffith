import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/advertisements_info/data/models/one_real_estate_response.dart';
part 'one_real_estate_states.freezed.dart';
@freezed
class OneRealEstateStates<T> with _$OneRealEstateStates<T> {
  const factory OneRealEstateStates.initial() = _Initial;
  const factory OneRealEstateStates.loading() = Loading;
  const factory OneRealEstateStates.success(OneRealEstateResponse data) = Success<T>;
  const factory OneRealEstateStates.error({required String error}) = Error;
}