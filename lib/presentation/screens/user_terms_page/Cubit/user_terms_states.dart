import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/user_terms_page/data/models/user_terms_response.dart';

part 'user_terms_states.freezed.dart';

@freezed
class UserTermsStates<T> with _$UserTermsStates<T> {
  const factory UserTermsStates.initial() = _Initial;
  const factory UserTermsStates.loading() = Loading;
  const factory UserTermsStates.success(UserTermsResponseBody data) = Success<T>;
  const factory UserTermsStates.error({required String error}) = Error;
}