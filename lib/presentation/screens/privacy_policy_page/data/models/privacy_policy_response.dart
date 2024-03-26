class PrivacyPolicyResponseBody {
  String? privacyPolicy;

  PrivacyPolicyResponseBody({this.privacyPolicy});

  PrivacyPolicyResponseBody.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacy_policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy_policy'] = this.privacyPolicy;
    return data;
  }
}