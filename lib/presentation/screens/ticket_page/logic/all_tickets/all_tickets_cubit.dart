import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/ticket_page/data/models/all_tickets_response_body.dart';
import '../../data/repo/add_ticket_repo.dart';
import 'all_tickets_state.dart';


class AllTicketsCubit extends Cubit<AllTicketsStates> {
  final AddTicketRepo _addTicketsRepo;
  AllTicketsCubit(this._addTicketsRepo)
      : super(const AllTicketsStates.initial());
  void emitAllTicketsStates(
      ) async {
    emit(const AllTicketsStates.loading());
    final response = await _addTicketsRepo.getAllTickets();
    response.when(success: (AllTicketsResponseBody allTicketsResponseBody) {
      emit(AllTicketsStates.success(allTicketsResponseBody));
    }, failure: (error) {
      emit(AllTicketsStates.error(error: error.apiErrorModel.message!));
    });
  }

}