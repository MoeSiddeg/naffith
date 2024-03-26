import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:naffith/presentation/screens/profile/data/models/update_faal_request.dart';
import 'package:naffith/presentation/screens/profile/data/models/upload_faal_response.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class UpdateFaalRepo{
  final ApiService _apiService;
  UpdateFaalRepo(this._apiService);
  Future<ApiResult<void>> updateFaal(FilePickerResult result,UpdateFaalRequest updateFaalRequest) async{
    File faal_document = File(result.files.single.path ?? "");
    try {
      final response = await _apiService.updateFaal(faal_document,'PUT','Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}