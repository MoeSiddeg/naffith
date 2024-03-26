import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import 'package:naffith/presentation/screens/my_orders/logic/my_order_buy/my_order_buy_state.dart';

import '../../data/repo/order_sale_repo.dart';



class MyOrderBuyCubit extends Cubit<MyOrderBuyState> {
  final OrderSaleRepo _orderSaleRepo;

  MyOrderBuyCubit(this._orderSaleRepo)
      : super(const MyOrderBuyState.initial());
  void emitMyOrderBuyStates(
     ) async {
    emit(const MyOrderBuyState.loading());
    final response = await _orderSaleRepo.myOrderBuyList();
    response.when(success: (OrderResponseGoal orderResponseGoal) {
      emit(MyOrderBuyState.success(orderResponseGoal));
    }, failure: (error) {
      print(error);
      emit(MyOrderBuyState.error(error: error.apiErrorModel.message!));
    });
  }

}