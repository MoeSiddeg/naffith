import 'package:naffith/presentation/screens/ticket_page/data/models/add_ticket_response_body.dart';
import 'package:naffith/presentation/screens/ticket_page/data/models/all_tickets_response_body.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class AddTicketRepo{
  final ApiService _apiService;
  AddTicketRepo(this._apiService);
  Future<ApiResult<AddTicketResponseBody>> addTicket({required String body,required int agent_id, required String type}) async {
    try {
      final response = await _apiService.addTicket(type, body, agent_id, 'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<AllTicketsResponseBody>> getAllTickets() async {
    try {
      final response = await _apiService.getAllTickets('Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}