class CreateOrderResponseBody {
  bool? success;
  String? message;
  Data? data;

  CreateOrderResponseBody({this.success, this.message, this.data});

  CreateOrderResponseBody.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  Null? orderStatus;
  Buyer? buyer;
  RealEstate? realEstate;

  Data({this.id, this.orderStatus, this.buyer, this.realEstate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['order_status'];
    buyer = json['buyer'] != null ? new Buyer.fromJson(json['buyer']) : null;
    realEstate = json['real_estate'] != null
        ? new RealEstate.fromJson(json['real_estate'])
        : null;
  }

}

class Buyer {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? userType;
  Null? blockedAt;

  Buyer(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.userType,
        this.blockedAt});

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    userType = json['user_type'];
    blockedAt = json['blocked_at'];
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
    return data;
  }
}

class RealEstate {
  int? id;
  String? goal;
  String? realEstateStatus;
  String? price;
  List<String>? interface;
  String? age;
  String? privateNote;
  String? note;
  String? adjectiveAdvertiser;
  Types? state;
  City? city;
  City? category;
  String? waterMeter;
  String? numberStreets;
  String? streetSpaces;
  String? numberBedrooms;
  String? floor;
  String? numberFloors;
  String? electricityMeter;
  String? announcementTime;
  List<Types>? comments;
  List<Images>? images;
  String? financingType;
  int? marketPrice;
  String? bathroom;

  RealEstate(
      {this.id,
        this.goal,
        this.realEstateStatus,
        this.price,
        this.interface,
        this.age,
        this.privateNote,
        this.note,
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
        this.financingType,
        this.marketPrice,
        this.bathroom});

  RealEstate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goal = json['goal'];
    realEstateStatus = json['real_estate_status'];
    price = json['price'];
    interface = json['interface'].cast<String>();
    age = json['age'];
    privateNote = json['private_note'];
    note = json['note'];
    adjectiveAdvertiser = json['adjective_advertiser'];
    state = json['state'] != null ? new Types.fromJson(json['state']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    category =
    json['category'] != null ? new City.fromJson(json['category']) : null;
    waterMeter = json['water_meter'];
    numberStreets = json['number_streets'];
    streetSpaces = json['street_spaces'];
    numberBedrooms = json['number_bedrooms'];
    floor = json['floor'];
    numberFloors = json['number_floors'];
    electricityMeter = json['electricity_meter'];
    announcementTime = json['announcement_time'];
    if (json['comments'] != null) {
      comments = <Types>[];
      json['comments'].forEach((v) {
        comments!.add( Types.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    financingType = json['financing_type'];
    marketPrice = json['market_price'];
    bathroom = json['bathroom'];
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