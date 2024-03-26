import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/privacy_policy_response.dart';

part 'privacy_policy_states.freezed.dart';

@freezed
class PrivacyPolicyStates<T> with _$PrivacyPolicyStates<T> {
  const factory PrivacyPolicyStates.initial() = _Initial;
  const factory PrivacyPolicyStates.loading() = Loading;
  const factory PrivacyPolicyStates.success(PrivacyPolicyResponseBody data) = Success<T>;
  const factory PrivacyPolicyStates.error({required String error}) = Error;
}