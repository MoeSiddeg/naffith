import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
part 'contractors_buy_state.freezed.dart';

@freezed
class ContractorsBuyState<T> with _$ContractorsBuyState<T> {
  const factory ContractorsBuyState.initial() = _Initial;
  const factory ContractorsBuyState.loading() = Loading;
  const factory ContractorsBuyState.success(OrderResponseGoal data) = Success<T>;
  const factory ContractorsBuyState.error({required String error}) = Error;
}