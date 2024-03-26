import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import 'package:naffith/presentation/screens/my_orders/logic/order_sale_state.dart';

import '../data/repo/order_sale_repo.dart';


class OrderSaleCubit extends Cubit<OrderSaleState> {
  final OrderSaleRepo _orderSaleRepo;

  OrderSaleCubit(this._orderSaleRepo)
      : super(const OrderSaleState.initial());
  void emitOrderSaleStates(
     ) async {
    emit(const OrderSaleState.loading());
    final response = await _orderSaleRepo.orderSaleList();
    response.when(success: (OrderResponseGoal orderResponseGoal) {
      emit(OrderSaleState.success(orderResponseGoal));
    }, failure: (error) {
      print(error);
      emit(OrderSaleState.error(error: error.apiErrorModel.message!));
    });
  }

}