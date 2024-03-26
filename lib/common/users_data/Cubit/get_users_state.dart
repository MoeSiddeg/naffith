import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/common/users_data/Data/models/users_response_body.dart';


part 'get_users_state.freezed.dart';

@freezed
abstract class GetUsersStates<T> with _$GetUsersStates<T> {
  const factory GetUsersStates.initial() = _Initial;
  const factory GetUsersStates.loading() = Loading;
  const factory GetUsersStates.success(List<UsersResponseBody> data) = Success<T>;
  const factory GetUsersStates.error({required String error}) = Error;
}