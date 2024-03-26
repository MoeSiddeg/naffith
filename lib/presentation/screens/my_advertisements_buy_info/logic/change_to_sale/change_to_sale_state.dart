import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_to_sale_state.freezed.dart';

@freezed
abstract class ChangeToSaleStates<T> with _$ChangeToSaleStates<T> {
  const factory ChangeToSaleStates.initial() = _Initial;

  const factory ChangeToSaleStates.loading() = Loading;
  const factory ChangeToSaleStates.success() = Success;
  const factory ChangeToSaleStates.error({required String error}) = Error;
}