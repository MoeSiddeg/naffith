
import 'package:json_annotation/json_annotation.dart';
part 'update_faal_request.g.dart';

@JsonSerializable()
class UpdateFaalRequest{
  @JsonKey(name: '_method')
  final String method;

  UpdateFaalRequest({required this.method});

  Map<String, dynamic> toJson() => _$UpdateFaalRequestToJson(this);
}