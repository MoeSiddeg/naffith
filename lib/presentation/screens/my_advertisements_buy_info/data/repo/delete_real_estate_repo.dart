import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';


class DeleteRealEstateRepo{
  final ApiService _apiService;
  DeleteRealEstateRepo(this._apiService);
  Future<ApiResult<void>> deleteRealEstate(String? id) async{
    try {
      final response = await _apiService.deleteRealEstate(id!,'DELETE','Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}