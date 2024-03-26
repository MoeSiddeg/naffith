import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/my_orders/data/models/order_response_goal.dart';
import '../../data/repo/order_sale_repo.dart';
import 'contractors_buy_state.dart';



class ContractorBuyCubit extends Cubit<ContractorsBuyState> {
  final OrderSaleRepo _orderSaleRepo;

  ContractorBuyCubit(this._orderSaleRepo)
      : super(const ContractorsBuyState.initial());
  void emitUsersOrdersListStates(
     ) async {
    emit(const ContractorsBuyState.loading());
    final response = await _orderSaleRepo.usersBuyOrderList();
    response.when(success: (OrderResponseGoal orderResponseGoal) {
      emit(ContractorsBuyState.success(orderResponseGoal));
    }, failure: (error) {
      print(error);
      emit(ContractorsBuyState.error(error: error.apiErrorModel.message!));
    });
  }

}