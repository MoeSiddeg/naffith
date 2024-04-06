class FilterRealEstateResponse {
  List<Data>? data;
  Links? links;
  Meta? meta;

  FilterRealEstateResponse({this.data, this.links, this.meta});

  FilterRealEstateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? goal;
  String? type;
  Owner? owner;
  String? subType;
  String? price;
  List<String>? interface;
  String? age;
  Null? saleStatue;
  String? adjectiveAdvertiser;
  String? announcementTime;
  States? state;
  City? city;
  List<Images>? images;

  Data(
      {this.id,
        this.goal,
        this.type,
        this.owner,
        this.subType,
        this.price,
        this.interface,
        this.age,
        this.saleStatue,
        this.adjectiveAdvertiser,
        this.announcementTime,
        this.state,
        this.city,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goal = json['goal'];
    type = json['type'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    subType = json['sub_type'];
    price = json['price'];
    interface = json['interface'].cast<String>();
    age = json['age'];
    saleStatue = json['sale_statue'];
    adjectiveAdvertiser = json['adjective_advertiser'];
    announcementTime = json['announcement_time'];
    state = json['state'] != null ? new States.fromJson(json['state']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal'] = this.goal;
    data['type'] = this.type;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['sub_type'] = this.subType;
    data['price'] = this.price;
    data['interface'] = this.interface;
    data['age'] = this.age;
    data['sale_statue'] = this.saleStatue;
    data['adjective_advertiser'] = this.adjectiveAdvertiser;
    data['announcement_time'] = this.announcementTime;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
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
  String? fcmToken;

  Owner(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.userType,
        this.blockedAt,
        this.fcmToken});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    userType = json['user_type'];
    blockedAt = json['blocked_at'];
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
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}

class States {
  int? id;
  String? name;
  Null? cities;

  States({this.id, this.name, this.cities});

  States.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
