
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/social_media_page/data/models/social_media_response_body.dart';

part 'social_media_states.freezed.dart';

@freezed
class SocialMediaStates<T> with _$SocialMediaStates<T> {
  const factory SocialMediaStates.initial() = _Initial;
  const factory SocialMediaStates.loading() = Loading;
  const factory SocialMediaStates.success(SocialMediaResponseBody data) = Success<T>;
  const factory SocialMediaStates.error({required String error}) = Error;
}