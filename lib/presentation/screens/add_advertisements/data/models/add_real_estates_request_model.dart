import 'package:json_annotation/json_annotation.dart';

part 'add_real_estates_request_model.g.dart';

@JsonSerializable()
class AddRealEstatesRequest {
  final String goal;
  final String price;
  final String area;
  final List<String> interface;
  final String water_meter;
  final String number_streets;
  final String street_spaces;
  final String? number_bedrooms; // Make number_bedrooms optional
  final String? floor; // Make floor optional
  final String? number_floors; // Make number_floors optional
  final String electricity_meter;
  final String data_validity;
  final String? age; // Make age optional
  final String adjective_advertiser;
  final String type;
  final String sub_type;
  final String state_id;
  final String city_id;
  final String note;
  final String bathroom;
  final List<String> financing_type;
  final List<String?> street_space;
  final String market_price;
  final String private_note;

  AddRealEstatesRequest({
    required this.goal,
    required this.price,
    required this.area,
    required this.interface,
    required this.water_meter,
    required this.number_streets,
    required this.street_spaces,
    this.number_bedrooms, // Update to nullable
    this.floor, // Update to nullable
    this.number_floors, // Update to nullable
    required this.electricity_meter,
    required this.data_validity,
    this.age, // Update to nullable
    required this.adjective_advertiser,
    required this.type,
    required this.sub_type,
    required this.state_id,
    required this.city_id,
    required this.note,
    required this.bathroom,
    required this.financing_type,
    required this.street_space ,
    required this.market_price,
    required this.private_note,
  });

  factory AddRealEstatesRequest.fromJson(Map<String, dynamic> json) => _$AddRealEstatesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddRealEstatesRequestToJson(this);
}
