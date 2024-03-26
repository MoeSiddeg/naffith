
import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

import '../models/all_favorites_response.dart';

class AllFavoritesRepo{
  final ApiService _apiService;
  AllFavoritesRepo(this._apiService);
  Future<ApiResult<AllRealEstatesResponseBody>> allFavorites() async {
    try {
      final response = await _apiService.getAllFavorites('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}