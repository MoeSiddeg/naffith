import 'package:naffith/presentation/screens/user_terms_page/data/models/user_terms_response.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';

class UserTermsRepo{
  final ApiService _apiService;
  UserTermsRepo(this._apiService);
  Future<ApiResult<UserTermsResponseBody>> getUserTerms() async {
    try {
      final response = await _apiService.getUserTerms();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}