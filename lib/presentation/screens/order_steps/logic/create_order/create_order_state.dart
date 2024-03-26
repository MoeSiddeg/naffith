import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/order_steps/data/models/create_order_response_body.dart';
part 'create_order_state.freezed.dart';

@freezed
abstract class CreateOrderStates<T> with _$CreateOrderStates<T> {
  const factory CreateOrderStates.initial() = _Initial;

  const factory CreateOrderStates.loading() = Loading;
  const factory CreateOrderStates.success(T data) = Success<T>;
  const factory CreateOrderStates.error({required String error}) = Error;
}