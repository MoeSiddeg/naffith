class AllFavoritesResponsBody {
  List<Data>? data;

  AllFavoritesResponsBody({this.data});

  AllFavoritesResponsBody.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? goal;
  String? price;
  String? interface;
  String? age;
  String? saleStatue;
  String? adjectiveAdvertiser;
  Types? state;
  Types? category;
  Types? city;
  List<Images>? images;

  Data(
      {this.id,
        this.goal,
        this.price,
        this.interface,
        this.age,
        this.saleStatue,
        this.adjectiveAdvertiser,
        this.state,
        this.category,
        this.city,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goal = json['goal'];
    price = json['price'];
    interface = json['interface'];
    age = json['age'];
    saleStatue = json['sale_statue'];
    adjectiveAdvertiser = json['adjective_advertiser'];
    state = json['state'] != null ? new Types.fromJson(json['state']) : null;
    category =
    json['category'] != null ? new Types.fromJson(json['category']) : null;
    city = json['city'] != null ? new Types.fromJson(json['city']) : null;
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
    data['price'] = this.price;
    data['interface'] = this.interface;
    data['age'] = this.age;
    data['sale_statue'] = this.saleStatue;
    data['adjective_advertiser'] = this.adjectiveAdvertiser;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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

class Types {
  int? id;
  String? name;

  Types({this.id, this.name});

  Types.fromJson(Map<String, dynamic> json) {
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