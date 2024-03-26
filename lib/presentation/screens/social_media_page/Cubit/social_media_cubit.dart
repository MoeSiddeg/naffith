import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naffith/presentation/screens/social_media_page/Cubit/social_media_states.dart';
import 'package:naffith/presentation/screens/social_media_page/data/models/social_media_response_body.dart';

import '../data/repo/social_media_repo.dart';

class SocialMediaCubit extends Cubit<SocialMediaStates> {
  final SocialMediaRepo _socilaMediaRepo;

  SocialMediaCubit(this._socilaMediaRepo)
      : super(const SocialMediaStates.initial());
  void emitSocialMediaStates(
      ) async {
    emit(const SocialMediaStates.loading());
    final response = await _socilaMediaRepo.getSocialMedia();
    response.when(success: (SocialMediaResponseBody socialMediaResponseBody) {
      emit(SocialMediaStates.success(socialMediaResponseBody));
    }, failure: (error) {
      emit(SocialMediaStates.error(error: error.apiErrorModel.message!));
    });
  }

}