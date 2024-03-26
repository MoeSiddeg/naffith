
import 'package:json_annotation/json_annotation.dart';
part 'update_note_request_model.g.dart';

@JsonSerializable()
class UpdateNoteRequestModel{
  @JsonKey(name: '_method')
  final String method;
  @JsonKey(name: 'private_note')
  final String  privateNote;
  UpdateNoteRequestModel({required this.method, required this.privateNote});

  Map<String, dynamic> toJson() => _$UpdateNoteRequestModelToJson(this);
}