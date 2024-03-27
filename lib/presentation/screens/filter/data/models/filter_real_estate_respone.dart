import 'package:json_annotation/json_annotation.dart';
part 'filter_real_estate_respone.g.dart';

@JsonSerializable()
class FilterRealEstateResponse {
  final int id;
  final String goal;
  final String price;
  final String type;
  @JsonKey(name: 'sub_type')
  final String subType;
  final int area;
  final List<String> interface;
  @JsonKey(name: 'water_meter')
  final String waterMeter;
  @JsonKey(name: 'number_streets')
  final String numberStreets;
  @JsonKey(name: 'street_spaces')
  final String streetSpaces;
  @JsonKey(name: 'number_bedrooms')
  final int? numberBedrooms;
  final int? floor;
  @JsonKey(name: 'number_floors')
  final int? numberFloors;
  @JsonKey(name: 'electricity_meter')
  final String electricityMeter;
  final String bathroom;
  @JsonKey(name: 'data_validity')
  final int dataValidity;
  final String note;
  @JsonKey(name: 'private_note')
  final String privateNote;
  final int? age;
  final String status;
  @JsonKey(name: 'adjective_advertiser')
  final String adjectiveAdvertiser;
  @JsonKey(name: 'real_estate_status')
  final String realEstateStatus;
  @JsonKey(name: 'publication_status')
  final String publicationStatus;
  @JsonKey(name: 'financing_type')
  final String financingType;
  @JsonKey(name: 'market_price')
  final int marketPrice;
  @JsonKey(name: 'state_id')
  final int stateId;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'owner_id')
  final int ownerId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  FilterRealEstateResponse({
    required this.id,
    required this.goal,
    required this.price,
    required this.type,
    required this.subType,
    required this.area,
    required this.interface,
    required this.waterMeter,
    required this.numberStreets,
    required this.streetSpaces,
    required this.numberBedrooms,
    required this.floor,
    required this.numberFloors,
    required this.electricityMeter,
    required this.bathroom,
    required this.dataValidity,
    required this.note,
    required this.privateNote,
    required this.age,
    required this.status,
    required this.adjectiveAdvertiser,
    required this.realEstateStatus,
    required this.publicationStatus,
    required this.financingType,
    required this.marketPrice,
    required this.stateId,
    required this.cityId,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FilterRealEstateResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterRealEstateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilterRealEstateResponseToJson(this);
}
