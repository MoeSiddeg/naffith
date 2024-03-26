import 'package:naffith/common/users_data/Data/models/users_response_body.dart';
import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../../../networking/api_service.dart';

class GetUsersRepo{
  final ApiService _apiService;
  GetUsersRepo(this._apiService);
  Future<ApiResult<List<UsersResponseBody>>> getUserList() async {
    try {
      final response = await _apiService.getUsers();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}