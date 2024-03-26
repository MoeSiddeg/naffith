import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/user_terms_page/Cubit/user_terms_states.dart';
import 'package:naffith/presentation/screens/user_terms_page/data/models/user_terms_response.dart';
import 'package:naffith/presentation/screens/user_terms_page/data/repo/user_terms_repo.dart';

class UserTermsCubit extends Cubit<UserTermsStates> {
  final UserTermsRepo _userTermsRepo;

  UserTermsCubit(this._userTermsRepo)
      : super(const UserTermsStates.initial());
  void emitUserTermsStates(
      ) async {
    emit(const UserTermsStates.loading());
    final response = await _userTermsRepo.getUserTerms();
    response.when(success: (UserTermsResponseBody userTermsResponseBody) {
      emit(UserTermsStates.success(userTermsResponseBody));
    }, failure: (error) {
      emit(UserTermsStates.error(error: error.apiErrorModel.message!));
    });
  }

}