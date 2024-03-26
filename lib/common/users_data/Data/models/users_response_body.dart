class UsersResponseBody {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? userType;

  UsersResponseBody(
      {this.id, this.name, this.email, this.phone, this.image, this.userType});

  UsersResponseBody.fromJson(Map<String, dynamic> json) {
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