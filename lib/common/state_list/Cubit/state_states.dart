import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/state_response.dart';


part 'state_states.freezed.dart';

@freezed
abstract class StateStates<T> with _$StateStates<T> {
  const factory StateStates.initial() = _Initial;
  const factory StateStates.loading() = Loading;
  const factory StateStates.success(StateResponse data) = Success<T>;
  const factory StateStates.error({required String error}) = Error;
}