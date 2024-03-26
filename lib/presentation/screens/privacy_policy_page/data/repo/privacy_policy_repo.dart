import 'package:naffith/presentation/screens/user_terms_page/data/models/user_terms_response.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../models/privacy_policy_response.dart';

class PrivacyPolicyRepo{
  final ApiService _apiService;
  PrivacyPolicyRepo(this._apiService);
  Future<ApiResult<PrivacyPolicyResponseBody>> getPrivacyPolicy() async {
    try {
      final response = await _apiService.getPrivacyPolicy();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}