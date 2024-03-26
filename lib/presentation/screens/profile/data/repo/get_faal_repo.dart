import 'package:naffith/presentation/screens/profile/data/models/get_faal_response.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class GetFaalRepo{
  final ApiService _apiService;
  GetFaalRepo(this._apiService);
  Future<ApiResult<GetFaalResponseBody>> getFaal() async{
    try {
      final response = await _apiService.getFaal('Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}