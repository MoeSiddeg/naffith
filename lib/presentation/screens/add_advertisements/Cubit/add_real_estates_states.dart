import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_real_estates_states.freezed.dart';

@freezed
class AddRealEstatesState<T> with _$AddRealEstatesState<T> {
  const factory AddRealEstatesState.initial() = _Initial;
  const factory AddRealEstatesState.loading() = Loading;
  const factory AddRealEstatesState.success(T data) = Success<T>;
  const factory AddRealEstatesState.error({required String error}) = Error;
}
