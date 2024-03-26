import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';

part 'all_real_estates_states.freezed.dart';

@freezed
class AllRealEstateStates<T> with _$AllRealEstateStates<T> {
  const factory AllRealEstateStates.initial() = _Initial;
  const factory AllRealEstateStates.loading() = Loading;
  const factory AllRealEstateStates.success(AllRealEstatesResponseBody data) = Success<T>;
  const factory AllRealEstateStates.error({required String error}) = Error;
}