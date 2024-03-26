import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/ticket_page/logic/add_ticket_state.dart';

import '../data/repo/add_ticket_repo.dart';

class AddTicketCubit extends Cubit<AddTicketStates> {
  final AddTicketRepo _addTicketRepo;
  AddTicketCubit(this._addTicketRepo) : super(const AddTicketStates.initial());

  void emitAddTicketStates({required String msg, required int agentId, required String type}) async {
    emit(const AddTicketStates.loading());
    final response = await _addTicketRepo.addTicket(body:msg, agent_id:agentId, type: type);
    response.when(success: (addRealEstatesResponseBody) {
      emit(AddTicketStates.success(addRealEstatesResponseBody));
    }, failure: (error) {
      emit(AddTicketStates.error(error: error.apiErrorModel.message!));
    });
  }

}