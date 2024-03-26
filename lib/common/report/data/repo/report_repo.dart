import 'package:naffith/common/networking/api_service.dart';
import 'package:naffith/common/report/data/models/report_response.dart';

import '../../../../global.dart';
import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';

class ReportRealEstatesRepo {
  final ApiService _apiService;
  ReportRealEstatesRepo(this._apiService);

  Future<ApiResult<ReportResponseBody>> reportRealEstates({ required String text , required String real_estate_id,required String type}) async {
    try {
      final response = await _apiService.reportRealEstate(text, real_estate_id,type,'Bearer ${Global.storageService.getUserToken()}');
      return
        ApiResult.success(response);
    } catch (error) {
      return   ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}