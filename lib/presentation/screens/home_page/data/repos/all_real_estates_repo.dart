import 'package:naffith/presentation/screens/home_page/data/models/all_real_estates_response_body.dart';
import 'package:naffith/presentation/screens/home_page/data/models/favorites/add_to_favorites_response.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class AllRealEstatesRepo{
   final ApiService _apiService;
   AllRealEstatesRepo(this._apiService);
   Future<ApiResult<AllRealEstatesResponseBody>> allRealEstatesList() async {
     try {
       final response = await _apiService.getAllRealEstates();

       return ApiResult.success(response);
     } catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
   }
   Future<ApiResult<AllRealEstatesResponseBody>> allRealEstatesSale() async {
     try {
       final response = await _apiService.getAllRealEstatesSale();

       return ApiResult.success(response);
     } catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
}
   Future<ApiResult<AllRealEstatesResponseBody>> allRealEstatesBuy() async {
     try {
       final response = await _apiService.getAllRealEstatesBuy();

       return ApiResult.success(response);
     } catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
   }
   Future<ApiResult<AddToFavoritesResponse>> addToFavorites({required String id}) async {
     try {
       final response = await _apiService.addToFavorites(id, 'Bearer ${Global.storageService.getUserToken()}');

       return ApiResult.success(response);
     } catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
   }
   Future<ApiResult<void>> deleteFromFavorite({required String id}) async {
     try {
       final response = await _apiService.deleteFromFavorites(id, 'DELETE','Bearer ${Global.storageService.getUserToken()}');

       return ApiResult.success(response);
     } catch (error) {
       return ApiResult.failure(ErrorHandler.handle(error));
     }
   }
 }