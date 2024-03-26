import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';

import '../../data/models/contractors_response_body.dart';


part 'contractors_state.freezed.dart';

@freezed
class ContractorsState<T> with _$ContractorsState<T> {
  const factory ContractorsState.initial() = _Initial;
  const factory ContractorsState.loading() = Loading;
  const factory ContractorsState.success(OrderResponseGoal data) = Success<T>;
  const factory ContractorsState.error({required String error}) = Error;
}