class AboutUsResponseBody {
  String? aboutUs;

  AboutUsResponseBody({this.aboutUs});

  AboutUsResponseBody.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_us'] = this.aboutUs;
    return data;
  }
}