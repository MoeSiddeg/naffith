import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';
import '../models/upload_faal_response.dart';


class FileRepository {
  final ApiService _apiService;

  FileRepository(this._apiService);

  Future<ApiResult<UploadFaalResponseBody>> uploadPdf(FilePickerResult result) async {
    File faal_document = File(result.files.single.path ?? "");
   // String faal_document = file.path.split('/').last;
    try {
    final response = await _apiService.uploadPdf(faal_document,'Bearer ${Global.storageService.getUserToken()}');
    return ApiResult.success(response);
  } catch (errro) {
    return ApiResult.failure(ErrorHandler.handle(errro));
  }
  }
}