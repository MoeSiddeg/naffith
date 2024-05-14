// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_real_estates_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRealEstatesRequest _$AddRealEstatesRequestFromJson(
        Map<String, dynamic> json) =>
    AddRealEstatesRequest(
      goal: json['goal'] as String,
      price: json['price'] as String,
      area: json['area'] as String,
      interface:
          (json['interface'] as List<dynamic>).map((e) => e as String).toList(),
      water_meter: json['water_meter'] as String,
      number_streets: json['number_streets'] as String,
      street_spaces: json['street_spaces'] as String,
      number_bedrooms: json['number_bedrooms'] as String?,
      floor: json['floor'] as String?,
      number_floors: json['number_floors'] as String?,
      electricity_meter: json['electricity_meter'] as String,
      data_validity: json['data_validity'] as String,
      age: json['age'] as String?,
      adjective_advertiser: json['adjective_advertiser'] as String,
      type: json['type'] as String,
      sub_type: json['sub_type'] as String,
      state_id: json['state_id'] as String,
      city_id: json['city_id'] as String,
      note: json['note'] as String,
      bathroom: json['bathroom'] as String,
      financing_type: (json['financing_type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      street_space: (json['street_space'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      market_price: json['market_price'] as String,
      private_note: json['private_note'] as String,
    );

Map<String, dynamic> _$AddRealEstatesRequestToJson(
        AddRealEstatesRequest instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'price': instance.price,
      'area': instance.area,
      'interface': instance.interface,
      'water_meter': instance.water_meter,
      'number_streets': instance.number_streets,
      'street_spaces': instance.street_spaces,
      'number_bedrooms': instance.number_bedrooms,
      'floor': instance.floor,
      'number_floors': instance.number_floors,
      'electricity_meter': instance.electricity_meter,
      'data_validity': instance.data_validity,
      'age': instance.age,
      'adjective_advertiser': instance.adjective_advertiser,
      'type': instance.type,
      'sub_type': instance.sub_type,
      'state_id': instance.state_id,
      'city_id': instance.city_id,
      'note': instance.note,
      'bathroom': instance.bathroom,
      'financing_type': instance.financing_type,
      'street_space': instance.street_space,
      'market_price': instance.market_price,
      'private_note': instance.private_note,
    };
