// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_real_estates_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRealEstatesResponseBody _$AddRealEstatesResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddRealEstatesResponseBody(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: RealEstateData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRealEstatesResponseBodyToJson(
        AddRealEstatesResponseBody instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

RealEstateData _$RealEstateDataFromJson(Map<String, dynamic> json) =>
    RealEstateData(
      id: json['id'] as int?,
      goal: json['goal'] as String?,
      price: json['price'] as String?,
      interface: json['interface'] as String?,
      age: json['age'] as String?,
      saleStatue: json['saleStatue'] as String?,
      adjectiveAdvertiser: json['adjectiveAdvertiser'] as String?,
      state: json['state'] == null
          ? null
          : EstateState.fromJson(json['state'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      waterMeter: json['waterMeter'] as String?,
      numberStreets: json['numberStreets'] as String?,
      streetSpaces: json['streetSpaces'] as String?,
      numberBedrooms: json['numberBedrooms'] as String?,
      floor: json['floor'] as String?,
      numberFloors: json['numberFloors'] as String?,
      electricityMeter: json['electricityMeter'] as String?,
      announcementTime: json['announcementTime'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RealEstateDataToJson(RealEstateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal': instance.goal,
      'price': instance.price,
      'interface': instance.interface,
      'age': instance.age,
      'saleStatue': instance.saleStatue,
      'adjectiveAdvertiser': instance.adjectiveAdvertiser,
      'state': instance.state?.toJson(),
      'city': instance.city?.toJson(),
      'category': instance.category?.toJson(),
      'waterMeter': instance.waterMeter,
      'numberStreets': instance.numberStreets,
      'streetSpaces': instance.streetSpaces,
      'numberBedrooms': instance.numberBedrooms,
      'floor': instance.floor,
      'numberFloors': instance.numberFloors,
      'electricityMeter': instance.electricityMeter,
      'announcementTime': instance.announcementTime,
      'comments': instance.comments,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };

EstateState _$EstateStateFromJson(Map<String, dynamic> json) => EstateState(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$EstateStateToJson(EstateState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int,
      userName: json['user_name'] as String,
      comment: json['comment'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'comment': instance.comment,
      'created_at': instance.createdAt,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
    };
