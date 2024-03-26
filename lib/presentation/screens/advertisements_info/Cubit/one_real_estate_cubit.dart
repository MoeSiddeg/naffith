import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/advertisements_info/Cubit/one_real_estate_states.dart';
import 'package:naffith/presentation/screens/advertisements_info/data/models/one_real_estate_response.dart';
import 'package:naffith/presentation/screens/advertisements_info/data/repo/one_real_estate_repo.dart';

class OneRealEstateCubit extends Cubit<OneRealEstateStates>{
  final OneRealEstateRepo _oneRealEstateRepo;
  OneRealEstateCubit(this._oneRealEstateRepo): super( const OneRealEstateStates.initial());
  String statusInArabic = '';
  void emitOneRealEstateStates({required String id}) async{
    emit(const OneRealEstateStates.loading());
    final response = await _oneRealEstateRepo.getOneRealEstate(id :id);
    response.when(success: (OneRealEstateResponse oneRealEstateResponse) {
      emit(OneRealEstateStates.success(oneRealEstateResponse));
      switch (oneRealEstateResponse.data!.realEstateStatus){
        case 'active':
          statusInArabic= 'نشط';
        case 'buy':
          statusInArabic = "تم الشراء";
        case 'sale':
          statusInArabic ="تم البيع";
        default:
          statusInArabic = "مفعل";
      }
    }, failure: (error) {
      emit(OneRealEstateStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
  void updateStatusInArabic(String newStatus) {
    statusInArabic = newStatus;
  }
}