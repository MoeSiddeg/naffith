import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class ChangeToBuyRepo{
  final ApiService _apiService;
  ChangeToBuyRepo(this._apiService);
  Future<ApiResult<void>> changeToBuy(String? id) async{
    try {
      final response = await _apiService.chaneToBuy(id!,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}