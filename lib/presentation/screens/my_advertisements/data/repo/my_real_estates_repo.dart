import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';
import '../models/my_real_estates_model.dart';

class MyRealEstatesRepo{
  final ApiService _apiService;
  MyRealEstatesRepo(this._apiService);
  Future<ApiResult<MyRealEstatesResponse>> myRealEstatesBuy() async {
    try {
      final response = await _apiService.getMyRealEstatesBuy('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<MyRealEstatesResponse>> myRealEstatesSales() async {
    try {
      final response = await _apiService.getMyRealEstatesSales('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}