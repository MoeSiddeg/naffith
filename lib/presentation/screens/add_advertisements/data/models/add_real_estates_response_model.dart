import 'package:json_annotation/json_annotation.dart';

part 'add_real_estates_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddRealEstatesResponseBody {
  late bool success;
  late String message;
  late RealEstateData data;

  AddRealEstatesResponseBody({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddRealEstatesResponseBody.fromJson(Map<String, dynamic> json){
   return   AddRealEstatesResponseBody(
     success: json['success'] as bool,
     message: json['message'] as String,
     data: json['data'],
   );
  }


  Map<String, dynamic> toJson() => _$AddRealEstatesResponseBodyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RealEstateData {
   int? id;
   String? goal;
   String? price;
   String? interface;
   String? age;
  String? saleStatue;
   String? adjectiveAdvertiser;
   EstateState? state;
   City? city;
   Category? category;
   String? waterMeter;
   String? numberStreets;
   String? streetSpaces;
   String? numberBedrooms;
   String? floor;
   String? numberFloors;
   String? electricityMeter;
   String? announcementTime;
   List<String>? comments;
   List<Image>? images;

  RealEstateData({
     this.id,
     this.goal,
     this.price,
     this.interface,
     this.age,
    this.saleStatue,
     this.adjectiveAdvertiser,
     this.state,
     this.city,
     this.category,
     this.waterMeter,
     this.numberStreets,
     this.streetSpaces,
     this.numberBedrooms,
     this.floor,
     this.numberFloors,
     this.electricityMeter,
     this.announcementTime,
     this.comments,
     this.images,
  });

  factory RealEstateData.fromJson(Map<String, dynamic> json) =>
      _$RealEstateDataFromJson(json) ??
          RealEstateData(
            id: 0,
            goal: "",
            price: "",
            interface: "",
            age: "",
            adjectiveAdvertiser: "",
            state: EstateState(id: 0, name: ""),
            city: City(id: 0, name: ""),
            category: Category(id: 0, name: ""),
            waterMeter: "",
            numberStreets: "",
            streetSpaces: "",
            numberBedrooms: "",
            floor: "",
            numberFloors: "",
            electricityMeter: "",
            announcementTime: "",
            comments: [],
            images: [],
          );

  Map<String, dynamic> toJson() => _$RealEstateDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EstateState {
  late int id;
  late String name;

  EstateState({
    required this.id,
    required this.name,
  });

  factory EstateState.fromJson(Map<String, dynamic> json) =>
      _$EstateStateFromJson(json) ?? EstateState(id: 0, name: "");

  Map<String, dynamic> toJson() => _$EstateStateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class City {
  late int id;
  late String name;

  City({
    required this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json) ?? City(id: 0, name: "");

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Category {
  late int id;
  late String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json) ?? Category(id: 0, name: "");

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Comment {
  late int id;
  @JsonKey(name: 'user_name')
  late String userName;
  late String comment;
  @JsonKey(name: 'created_at')
  late String createdAt;

  Comment({
    required this.id,
    required this.userName,
    required this.comment,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json) ?? Comment(id: 0, userName: "", comment: "", createdAt: "");

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Image {
  late String url;

  Image({
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json) ?? Image(url: "");

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
