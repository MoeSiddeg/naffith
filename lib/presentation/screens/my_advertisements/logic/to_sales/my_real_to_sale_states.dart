import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/models/my_real_estates_model.dart';
part 'my_real_to_sale_states.freezed.dart';
@freezed
class MyRealEstatesToSaleStates<T> with _$MyRealEstatesToSaleStates<T> {
  const factory MyRealEstatesToSaleStates.initial() = _Initial;
  const factory MyRealEstatesToSaleStates.loading() = Loading;
  const factory MyRealEstatesToSaleStates.success(MyRealEstatesResponse data) = Success<T>;
  const factory MyRealEstatesToSaleStates.error({required String error}) = Error;
}