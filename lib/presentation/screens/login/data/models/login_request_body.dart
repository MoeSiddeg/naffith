import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String email;
  final String password;

  @JsonKey(name: 'fcm_token') // Add this line
  final String fcmToken;

  LoginRequestBody({
    required this.email,
    required this.password,
    required this.fcmToken,

  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}