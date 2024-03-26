import 'package:naffith/presentation/screens/advertisements_info/data/models/one_real_estate_response.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';

class OneRealEstateRepo{
  final ApiService _apiService;
  OneRealEstateRepo(this._apiService);
  Future<ApiResult<OneRealEstateResponse>> getOneRealEstate({required String id}) async{
    try{
      final response = await _apiService.getOneRealEstate(id);
      return ApiResult.success(response);
    }catch (error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}