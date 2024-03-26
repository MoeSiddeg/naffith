import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/presentation/screens/about_us_page/data/models/about_us_response.dart';


part 'about_us_states.freezed.dart';

@freezed
class AboutUsStates<T> with _$AboutUsStates<T> {
  const factory AboutUsStates.initial() = _Initial;
  const factory AboutUsStates.loading() = Loading;
  const factory AboutUsStates.success(AboutUsResponseBody data) = Success<T>;
  const factory AboutUsStates.error({required String error}) = Error;
}