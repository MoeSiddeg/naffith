
import 'package:naffith/presentation/screens/my_orders/data/models/contractors_response_body.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';
import '../models/order_response_goal.dart';



class OrderSaleRepo{
  final ApiService _apiService;
  OrderSaleRepo(this._apiService);
  Future<ApiResult<OrderResponseGoal>> orderSaleList() async {
    try {
      final response = await _apiService.getOrderSaleList('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<OrderResponseGoal>> myOrderBuyList() async {
    try {
      final response = await _apiService.getMyOrderBuyList('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
  Future<ApiResult<ContractorsResponseBody>> contractorsList(String id) async {
    try {
      final response = await _apiService.getContractors(id,'Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<OrderResponseGoal>> usersSaleOrderList() async {
    try {
      final response = await _apiService.getUsersSaleOrderList('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
  Future<ApiResult<OrderResponseGoal>> usersBuyOrderList() async {
    try {
      final response = await _apiService.getUsersBuyOrderList('Bearer ${Global.storageService.getUserToken()}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }
}