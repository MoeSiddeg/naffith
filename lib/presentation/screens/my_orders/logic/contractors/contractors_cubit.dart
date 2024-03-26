import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import '../../data/repo/order_sale_repo.dart';
import 'contractors_state.dart';



class ContractorCubit extends Cubit<ContractorsState> {
  final OrderSaleRepo _orderSaleRepo;

  ContractorCubit(this._orderSaleRepo)
      : super(const ContractorsState.initial());
  void emitMyOrdersListStates(
     ) async {
    emit(const ContractorsState.loading());
    final response = await _orderSaleRepo.usersSaleOrderList();
    response.when(success: (OrderResponseGoal orderResponseGoal) {
      emit(ContractorsState.success(orderResponseGoal));
    }, failure: (error) {
      print(error);
      emit(ContractorsState.error(error: error.apiErrorModel.message!));
    });
  }

}