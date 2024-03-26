
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/order_steps/data/repo/create_order_repo.dart';
import 'package:naffith/presentation/screens/order_steps/logic/create_order/create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderStates> {
  final CreateOrderRepo _createOrderRepo;
  CreateOrderCubit(this._createOrderRepo)
      : super(const CreateOrderStates.initial());

  void emitCreateOrderStates(String? real_estate_id) async {
    emit(const CreateOrderStates.loading());
    final response = await _createOrderRepo.createOrder(real_estate_id!);
    response.when(success: (createOrderResponseBody) {
      emit(CreateOrderStates.success(createOrderResponseBody));
    }, failure: (error) {
      emit(CreateOrderStates.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}