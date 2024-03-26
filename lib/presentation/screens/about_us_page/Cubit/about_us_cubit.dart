import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/about_us_page/Cubit/about_us_states.dart';
import 'package:naffith/presentation/screens/about_us_page/data/models/about_us_response.dart';

import '../data/repo/about_us_repo.dart';


class AboutUsCubit extends Cubit<AboutUsStates> {
  final AboutUsRepo _aboutUsRepo;

  AboutUsCubit(this._aboutUsRepo)
      : super(const AboutUsStates.initial());
  void emitAboutUsStates(
      ) async {
    emit(const AboutUsStates.loading());
    final response = await _aboutUsRepo.getAboutUs();
    response.when(success: (AboutUsResponseBody aboutUsResponseBody) {
      emit(AboutUsStates.success(aboutUsResponseBody));
    }, failure: (error) {
      emit(AboutUsStates.error(error: error.apiErrorModel.message!));
    });
  }

}