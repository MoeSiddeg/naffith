import 'package:freezed_annotation/freezed_annotation.dart';


part 'my_order_buy_state.freezed.dart';

@freezed
class MyOrderBuyState<T> with _$MyOrderBuyState<T> {
  const factory MyOrderBuyState.initial() = _Initial;
  const factory MyOrderBuyState.loading() = Loading;
  const factory MyOrderBuyState.success(T data) = Success<T>;
  const factory MyOrderBuyState.error({required String error}) = Error;
}