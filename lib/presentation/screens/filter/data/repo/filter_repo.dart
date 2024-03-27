import 'package:naffith/common/networking/api_service.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../models/filter_real_estate_respone.dart';

class EstateFilterRepo {
  final ApiService _realEstateApi;

  EstateFilterRepo(this._realEstateApi);

  Future<ApiResult<List<FilterRealEstateResponse>>> getFilteredRealEstates({
    String? goal,
    int? stateId,
    int? cityId,
    int? priceFrom,
    int? priceTo,
    int? areaFrom,
    int? areaTo,
  }) async {
    try {
      final response = await _realEstateApi.getFilteredRealEstates(
        goal: goal,
        stateId: stateId,
        cityId: cityId,
        priceFrom: priceFrom,
        priceTo: priceTo,
        areaFrom: areaFrom,
        areaTo: areaTo,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
