import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/comman_questions_page/data/models/comman_questions_response.dart';

part 'comman_questions_states.freezed.dart';

@freezed
class CommanQuestionsStates<T> with _$CommanQuestionsStates<T> {
  const factory CommanQuestionsStates.initial() = _Initial;
  const factory CommanQuestionsStates.loading() = Loading;
  const factory CommanQuestionsStates.success(CommanQuestionsResponseBody data) = Success<T>;
  const factory CommanQuestionsStates.error({required String error}) = Error;
}