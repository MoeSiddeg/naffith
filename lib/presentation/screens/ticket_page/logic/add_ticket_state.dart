import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/ticket_page/data/models/add_ticket_response_body.dart';

part 'add_ticket_state.freezed.dart';

@freezed
abstract class AddTicketStates<T> with _$AddTicketStates<T> {
  const factory AddTicketStates.initial() = _Initial;
  const factory AddTicketStates.loading() = Loading;
  const factory AddTicketStates.success(AddTicketResponseBody data) = Success<T>;
  const factory AddTicketStates.error({required String error}) = Error;
}