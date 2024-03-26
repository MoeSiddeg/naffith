import 'package:naffith/common/cities/data/models/cities_response.dart';

import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../../../networking/api_service.dart';

class CitiesRepo{
  final ApiService _apiService;
  CitiesRepo(this._apiService);
  Future<ApiResult<CitiesResponseBody>> getCitiesList(String id) async {
    try {
      final response = await _apiService.getCitiesList(id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}