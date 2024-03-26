import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cities_response.freezed.dart';
part 'cities_response.g.dart';

@freezed
class CitiesResponseBody with _$CitiesResponseBody {
  factory CitiesResponseBody({
    required Data data,
  }) = _CitiesResponseBody;

  factory CitiesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseBodyFromJson(json);
}

@JsonSerializable()
class Data {
  int id;
  String name;
  List<Cities>? cities;

  Data({
    required this.id,
    required this.name,
    this.cities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Cities {
  int id;
  String name;
  @JsonKey(name: 'state_id')
  int stateId;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  Cities({
    required this.id,
    required this.name,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesToJson(this);
}