import 'package:naffith/presentation/screens/order_steps/data/models/create_order_response_body.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class CreateOrderRepo{
  final ApiService _apiService;
  CreateOrderRepo(this._apiService);
  Future<ApiResult<CreateOrderResponseBody>> createOrder(String? real_estate_id) async{
    try {
      final response = await _apiService.createOrder(real_estate_id!,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}