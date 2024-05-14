class OneRealEstateResponse {
  Data? data;

  OneRealEstateResponse({this.data});

  OneRealEstateResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? goal;
  String? realEstateStatus;
  String? type;
  Owner? owner;
  String? subType;
  String? price;
  List<String>? interface;
  String? age;
  String? privateNote;
  String? note;
  String? adjectiveAdvertiser;
  Types? state;
  City? city;
  String? waterMeter;
  String? numberStreets;
  String? streetSpaces;
  String? numberBedrooms;
  String? floor;
  String? numberFloors;
  String? electricityMeter;
  String? announcementTime;
  List<Null>? comments;
  List<Images>? images;
  List<String>? financingType;
  int? marketPrice;
  String? bathroom;
  List<String>? streetSpace;

  Data(
      {this.id,
        this.goal,
        this.realEstateStatus,
        this.type,
        this.owner,
        this.subType,
        this.price,
        this.interface,
        this.age,
        this.privateNote,
        this.note,
        this.adjectiveAdvertiser,
        this.state,
        this.city,
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
        this.financingType,
        this.marketPrice,
        this.bathroom,
        this.streetSpace});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goal = json['goal'];
    realEstateStatus = json['real_estate_status'];
    type = json['type'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    subType = json['sub_type'];
    price = json['price'];
    interface = json['interface'].cast<String>();
    age = json['age'];
    privateNote = json['private_note'];
    note = json['note'];
    adjectiveAdvertiser = json['adjective_advertiser'];
    state = json['state'] != null ? new Types.fromJson(json['state']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    waterMeter = json['water_meter'];
    numberStreets = json['number_streets'];
    streetSpaces = json['street_spaces'];
    numberBedrooms = json['number_bedrooms'];
    floor = json['floor'];
    numberFloors = json['number_floors'];
    electricityMeter = json['electricity_meter'];
    announcementTime = json['announcement_time'];

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    financingType = json['financing_type'].cast<String>();
    marketPrice = json['market_price'];
    bathroom = json['bathroom'];
    streetSpace = json['street_space'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal'] = this.goal;
    data['real_estate_status'] = this.realEstateStatus;
    data['type'] = this.type;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['sub_type'] = this.subType;
    data['price'] = this.price;
    data['interface'] = this.interface;
    data['age'] = this.age;
    data['private_note'] = this.privateNote;
    data['note'] = this.note;
    data['adjective_advertiser'] = this.adjectiveAdvertiser;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['water_meter'] = this.waterMeter;
    data['number_streets'] = this.numberStreets;
    data['street_spaces'] = this.streetSpaces;
    data['number_bedrooms'] = this.numberBedrooms;
    data['floor'] = this.floor;
    data['number_floors'] = this.numberFloors;
    data['electricity_meter'] = this.electricityMeter;
    data['announcement_time'] = this.announcementTime;

    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['financing_type'] = this.financingType;
    data['market_price'] = this.marketPrice;
    data['bathroom'] = this.bathroom;
    data['street_space'] = this.streetSpace;
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? userType;
  Null? blockedAt;
  Null? note;
  String? fcmToken;

  Owner(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.userType,
        this.blockedAt,
        this.note,
        this.fcmToken});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    userType = json['user_type'];
    blockedAt = json['blocked_at'];
    note = json['note'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['user_type'] = this.userType;
    data['blocked_at'] = this.blockedAt;
    data['note'] = this.note;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}

class Types {
  int? id;
  String? name;
  Null? cities;

  Types({this.id, this.name, this.cities});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cities = json['cities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cities'] = this.cities;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}