class UserTermsResponseBody {
  String? userTermsOfUse;

  UserTermsResponseBody({this.userTermsOfUse});

  UserTermsResponseBody.fromJson(Map<String, dynamic> json) {
    userTermsOfUse = json['user_terms_of_use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_terms_of_use'] = this.userTermsOfUse;
    return data;
  }
}