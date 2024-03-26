import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class ChangeToSaleRepo{
  final ApiService _apiService;
  ChangeToSaleRepo(this._apiService);
  Future<ApiResult<void>> changeToSale(String? id) async{
    try {
      final response = await _apiService.chaneToSale(id!,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}