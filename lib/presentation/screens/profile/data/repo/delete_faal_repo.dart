import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';
import '../models/update_faal_request.dart';
import '../models/upload_faal_response.dart';

class DeleteFaalRepo{
  final ApiService _apiService;
  DeleteFaalRepo(this._apiService);
  Future<ApiResult<void>> updateFaal(UpdateFaalRequest updateFaalRequest) async{
    try {
      final response = await _apiService.deleteFaal('DELETE','Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}