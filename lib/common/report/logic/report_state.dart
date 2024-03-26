import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naffith/common/report/data/models/report_response.dart';
part 'report_state.freezed.dart';

@freezed
class ReportRealEstateState<T> with _$ReportRealEstateState<T> {
  const factory ReportRealEstateState.initial() = _Initial;
  const factory ReportRealEstateState.loading() = Loading;
  const factory ReportRealEstateState.success(ReportResponseBody data) = Success<T>;
  const factory ReportRealEstateState.error({required String error}) = Error;
}