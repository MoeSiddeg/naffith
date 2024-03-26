import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';

part 'all_real_estates_buy_states.freezed.dart';

@freezed
class AllRealEstateBuyStates<T> with _$AllRealEstateBuyStates<T> {
  const factory AllRealEstateBuyStates.initial() = _Initial;
  const factory AllRealEstateBuyStates.loading() = Loading;
  const factory AllRealEstateBuyStates.success(AllRealEstatesResponseBody data) = Success<T>;
  const factory AllRealEstateBuyStates.error({required String error}) = Error;
}