import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/all_tickets_response_body.dart';
part 'all_tickets_state.freezed.dart';

@freezed
abstract class AllTicketsStates<T> with _$AllTicketsStates<T> {
  const factory AllTicketsStates.initial() = _Initial;
  const factory AllTicketsStates.loading() = Loading;
  const factory AllTicketsStates.success(AllTicketsResponseBody data) = Success<T>;
  const factory AllTicketsStates.error({required String error}) = Error;
}