import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'token_type')
  String? tokenType;
  User? user;



  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse(this.accessToken, this.tokenType, this.user);
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  @JsonKey(name: 'user_type')
  String? userType;
  @JsonKey(name: 'blocked_at')
  String? blockedAt;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  User(this.id, this.name, this.email, this.phone, this.image, this.userType, this.blockedAt);
}
