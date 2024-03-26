import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';

part 'all_real_estates_list_states.freezed.dart';

@freezed
class AllRealEstateListStates<T> with _$AllRealEstateListStates<T> {
  const factory AllRealEstateListStates.initial() = _Initial;
  const factory AllRealEstateListStates.loading() = Loading;
  const factory AllRealEstateListStates.success(AllRealEstatesResponseBody data) = Success<T>;
  const factory AllRealEstateListStates.error({required String error}) = Error;
}