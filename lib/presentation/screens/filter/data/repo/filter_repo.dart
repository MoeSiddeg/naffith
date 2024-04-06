import 'package:naffith/common/networking/api_service.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../models/filter_real_estate_respone.dart';

class EstateFilterRepo {
  final ApiService _realEstateApi;

  EstateFilterRepo(this._realEstateApi);

  Future<ApiResult<FilterRealEstateResponse>> getFilteredRealEstates({
    String? goal,
    int? stateId,
    int? cityId,
    int? priceFrom,
    int? priceTo,
    int? areaFrom,
    int? areaTo,
     String? price_direction,
    String? area_direction,
 int? market_price,
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
        price_direction: price_direction,
        area_direction: area_direction,
        market_price: market_price

      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
