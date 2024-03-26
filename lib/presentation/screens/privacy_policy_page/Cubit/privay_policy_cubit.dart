import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/privacy_policy_page/Cubit/privacy_policy_states.dart';

import '../data/models/privacy_policy_response.dart';
import '../data/repo/privacy_policy_repo.dart';


class PrivacyPolicyCubit extends Cubit<PrivacyPolicyStates> {
  final PrivacyPolicyRepo _privacyPolicyRepo;

  PrivacyPolicyCubit(this._privacyPolicyRepo)
      : super(const PrivacyPolicyStates.initial());
  void emitPrivacyPolicyStates(
      ) async {
    emit(const PrivacyPolicyStates.loading());
    final response = await _privacyPolicyRepo.getPrivacyPolicy();
    response.when(success: (PrivacyPolicyResponseBody privacyPolicyResponseBody) {
      emit(PrivacyPolicyStates.success(privacyPolicyResponseBody));
    }, failure: (error) {
      emit(PrivacyPolicyStates.error(error: error.apiErrorModel.message!));
    });
  }

}