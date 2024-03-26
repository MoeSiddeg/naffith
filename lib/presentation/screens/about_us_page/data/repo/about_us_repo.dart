import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../models/about_us_response.dart';


class AboutUsRepo{
  final ApiService _apiService;
  AboutUsRepo(this._apiService);
  Future<ApiResult<AboutUsResponseBody>> getAboutUs() async {
    try {
      final response = await _apiService.getAboutUs();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}