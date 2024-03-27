import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/filter_real_estate_respone.dart';
part 'filter_state.freezed.dart';

@freezed
class EstateFilterState<T> with _$EstateFilterState<T> {
  const factory EstateFilterState.initial() = _Initial;

  const factory EstateFilterState.loading() = Loading;
  const factory EstateFilterState.success(List<FilterRealEstateResponse> data) = Success<T>;
  const factory EstateFilterState.error({required String error}) = Error;
}
