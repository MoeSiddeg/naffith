import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class ChangeStatusRepo{
  final ApiService _apiService;
  ChangeStatusRepo(this._apiService);
  Future<ApiResult<void>> changeStatus(String? id,String order_status) async{
    try {
      final response = await _apiService.chaneStatus(id!,'PATCH',order_status,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}