import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../models/social_media_response_body.dart';

class SocialMediaRepo{
  final ApiService _apiService;
  SocialMediaRepo(this._apiService);
  Future<ApiResult<SocialMediaResponseBody>> getSocialMedia() async {
    try {
      final response = await _apiService.getSocialMedia();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}