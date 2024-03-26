class AddTicketResponseBody {
  bool? success;
  String? message;
  Data? data;

  AddTicketResponseBody({this.success, this.message, this.data});

  AddTicketResponseBody.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  String? body;
  Agent? agent;

  Data({this.type, this.body, this.agent});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    body = json['body'];
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['body'] = this.body;
    if (this.agent != null) {
      data['agent'] = this.agent!.toJson();
    }
    return data;
  }
}

class Agent {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? userType;

  Agent(
      {this.id, this.name, this.email, this.phone, this.image, this.userType});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['user_type'] = this.userType;
    return data;
  }
}