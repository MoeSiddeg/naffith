
import 'package:naffith/common/category/data/models/category_response_body.dart';
import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../../../networking/api_service.dart';

class CategoryRepo{
  final ApiService _apiService;
  CategoryRepo(this._apiService);
  Future<ApiResult<CategoryResponseBody>> getCategoryList() async {
    try {
      final response = await _apiService.getCategory();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}