import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_to_buy_state.freezed.dart';

@freezed
abstract class ChangeToBuyStates<T> with _$ChangeToBuyStates<T> {
  const factory ChangeToBuyStates.initial() = _Initial;

  const factory ChangeToBuyStates.loading() = Loading;
  const factory ChangeToBuyStates.success() = Success;
  const factory ChangeToBuyStates.error({required String error}) = Error;
}