// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_real_estate_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterRealEstateResponse _$FilterRealEstateResponseFromJson(
        Map<String, dynamic> json) =>
    FilterRealEstateResponse(
      id: json['id'] as int,
      goal: json['goal'] as String,
      price: json['price'] as String,
      type: json['type'] as String,
      subType: json['sub_type'] as String,
      area: json['area'] as int,
      interface:
          (json['interface'] as List<dynamic>).map((e) => e as String).toList(),
      waterMeter: json['water_meter'] as String,
      numberStreets: json['number_streets'] as String,
      streetSpaces: json['street_spaces'] as String,
      numberBedrooms: json['number_bedrooms'] as int?,
      floor: json['floor'] as int?,
      numberFloors: json['number_floors'] as int?,
      electricityMeter: json['electricity_meter'] as String,
      bathroom: json['bathroom'] as String,
      dataValidity: json['data_validity'] as int,
      note: json['note'] as String,
      privateNote: json['private_note'] as String,
      age: json['age'] as int?,
      status: json['status'] as String,
      adjectiveAdvertiser: json['adjective_advertiser'] as String,
      realEstateStatus: json['real_estate_status'] as String,
      publicationStatus: json['publication_status'] as String,
      financingType: json['financing_type'] as String,
      marketPrice: json['market_price'] as int,
      stateId: json['state_id'] as int,
      cityId: json['city_id'] as int,
      ownerId: json['owner_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$FilterRealEstateResponseToJson(
        FilterRealEstateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal': instance.goal,
      'price': instance.price,
      'type': instance.type,
      'sub_type': instance.subType,
      'area': instance.area,
      'interface': instance.interface,
      'water_meter': instance.waterMeter,
      'number_streets': instance.numberStreets,
      'street_spaces': instance.streetSpaces,
      'number_bedrooms': instance.numberBedrooms,
      'floor': instance.floor,
      'number_floors': instance.numberFloors,
      'electricity_meter': instance.electricityMeter,
      'bathroom': instance.bathroom,
      'data_validity': instance.dataValidity,
      'note': instance.note,
      'private_note': instance.privateNote,
      'age': instance.age,
      'status': instance.status,
      'adjective_advertiser': instance.adjectiveAdvertiser,
      'real_estate_status': instance.realEstateStatus,
      'publication_status': instance.publicationStatus,
      'financing_type': instance.financingType,
      'market_price': instance.marketPrice,
      'state_id': instance.stateId,
      'city_id': instance.cityId,
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
