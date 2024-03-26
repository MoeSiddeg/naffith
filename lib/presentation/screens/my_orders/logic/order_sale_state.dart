import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';


part 'order_sale_state.freezed.dart';

@freezed
class OrderSaleState<T> with _$OrderSaleState<T> {
  const factory OrderSaleState.initial() = _Initial;
  const factory OrderSaleState.loading() = Loading;
  const factory OrderSaleState.success(T data) = Success<T>;
  const factory OrderSaleState.error({required String error}) = Error;
}