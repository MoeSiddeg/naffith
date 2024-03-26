import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/comman_questions_page/Cubit/comman_questions_states.dart';
import 'package:naffith/presentation/screens/comman_questions_page/data/models/comman_questions_response.dart';
import 'package:naffith/presentation/screens/comman_questions_page/data/repo/comman_questions_repo.dart';

class CommanQuestionsCubit extends Cubit<CommanQuestionsStates> {
  final CommanQuestionsRepo _commanQuestionsRepo;

  CommanQuestionsCubit(this._commanQuestionsRepo)
      : super(const CommanQuestionsStates.initial());
  void emitCommanQuestionsStates(
      ) async {
    emit(const CommanQuestionsStates.loading());
    final response = await _commanQuestionsRepo.getCommanQuestions();
    response.when(success: (CommanQuestionsResponseBody commanQuestionsResponseBody) {
      emit(CommanQuestionsStates.success(commanQuestionsResponseBody));
    }, failure: (error) {
      emit(CommanQuestionsStates.error(error: error.apiErrorModel.message!));
    });
  }

}