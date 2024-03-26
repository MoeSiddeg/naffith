import 'package:naffith/presentation/screens/my_advertisements_buy_info/data/models/update_note_request_model.dart';

import '../../../../../common/networking/api_error_handler.dart';
import '../../../../../common/networking/api_result.dart';
import '../../../../../common/networking/api_service.dart';
import '../../../../../global.dart';

class UpdateNoteRepo{
  final ApiService _apiService;
  UpdateNoteRepo(this._apiService);
  Future<ApiResult<void>> updateNote(String? id,String private_note) async{
    try {
      final response = await _apiService.updateNote(id!,'PATCH',private_note,'Bearer ${Global.storageService.getUserToken()}');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}