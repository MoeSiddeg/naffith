// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      name: json['name'] as String,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => Cities.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cities': instance.cities,
    };

Cities _$CitiesFromJson(Map<String, dynamic> json) => Cities(
      id: json['id'] as int,
      name: json['name'] as String,
      stateId: json['state_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state_id': instance.stateId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$CitiesResponseBodyImpl _$$CitiesResponseBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$CitiesResponseBodyImpl(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CitiesResponseBodyImplToJson(
        _$CitiesResponseBodyImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
