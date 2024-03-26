// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_note_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNoteRequestModel _$UpdateNoteRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateNoteRequestModel(
      method: json['_method'] as String,
      privateNote: json['private_note'] as String,
    );

Map<String, dynamic> _$UpdateNoteRequestModelToJson(
        UpdateNoteRequestModel instance) =>
    <String, dynamic>{
      '_method': instance.method,
      'private_note': instance.privateNote,
    };
