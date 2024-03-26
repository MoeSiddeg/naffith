import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class HideRealEstateRepo{
  final ApiService _apiService;
  HideRealEstateRepo(this._apiService);
  Future<ApiResult<void>> hideRealEstate(String? id) async{
    try {
      final response = await _apiService.hideRealEstate(id!,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}