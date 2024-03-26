
import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../../../networking/api_service.dart';
import '../models/state_response.dart';

class StateRepo{
  final ApiService _apiService;
  StateRepo(this._apiService);
  Future<ApiResult<StateResponse>> getStateList() async {
    try {
      final response = await _apiService.getStatesList();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}