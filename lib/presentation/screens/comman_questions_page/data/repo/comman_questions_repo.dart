import 'package:naffith/presentation/screens/comman_questions_page/data/models/comman_questions_response.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';

class CommanQuestionsRepo{
  final ApiService _apiService;
  CommanQuestionsRepo(this._apiService);
  Future<ApiResult<CommanQuestionsResponseBody>> getCommanQuestions() async {
    try {
      final response = await _apiService.getCommanQuestions();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}