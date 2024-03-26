import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/category_response_body.dart';

part 'category_states.freezed.dart';

@freezed
abstract class CategoryStates<T> with _$CategoryStates<T> {
  const factory CategoryStates.initial() = _Initial;
  const factory CategoryStates.loading() = Loading;
  const factory CategoryStates.success(CategoryResponseBody data) = Success<T>;
  const factory CategoryStates.error({required String error}) = Error;
}