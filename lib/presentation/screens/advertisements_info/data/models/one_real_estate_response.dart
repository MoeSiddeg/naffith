class OneRealEstateResponse {
  Data? data;

  OneRealEstateResponse({this.data});

  OneRealEstateResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? id;
  String? goal;
  String? realEstateStatus;
  String? type;
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
  List<String>? comments;
  List<Images>? images;
  String? financingType;
  int? marketPrice;
  String? bathroom;

  Data(
      {this.id,
        this.goal,
        this.realEstateStatus,
        this.type,
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
        this.bathroom});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goal = json['goal'];
    realEstateStatus = json['real_estate_status'];
    type = json['type'];
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