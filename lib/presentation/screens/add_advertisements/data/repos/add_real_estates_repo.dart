import 'dart:io';
import 'package:dio/dio.dart';
import 'package:naffith/presentation/screens/add_advertisements/data/models/add_real_estates_request_model.dart';
import '../../../../../common/networking/add_real_estates_api.dart';
import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';

class AddRealEstatesRepo {
  final AddRealApiService _apiService;
  AddRealEstatesRepo(this._apiService);

  Future<ApiResult<Response<Map<String,dynamic>>>> addRealEstates(
       AddRealEstatesRequest addRealEstatesRequest ,  List<File> images) async {
    try {
      final response = await _apiService.addRealEstates(addRealEstatesRequest, images );
      return
        ApiResult.success(response);
    } catch (error) {
      return   ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}
