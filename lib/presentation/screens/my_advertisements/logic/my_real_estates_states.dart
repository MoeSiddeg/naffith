import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/my_advertisements/data/models/my_real_estates_model.dart';
part 'my_real_estates_states.freezed.dart';
@freezed
class MyRealEstatesStates<T> with _$MyRealEstatesStates<T> {
  const factory MyRealEstatesStates.initial() = _Initial;
  const factory MyRealEstatesStates.loading() = Loading;
  const factory MyRealEstatesStates.success(MyRealEstatesResponse data) = Success<T>;
  const factory MyRealEstatesStates.error({required String error}) = Error;
}