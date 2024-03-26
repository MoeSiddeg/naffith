class SocialMediaResponseBody {
  SocialMedia? socialMedia;

  SocialMediaResponseBody({this.socialMedia});

  SocialMediaResponseBody.fromJson(Map<String, dynamic> json) {
    socialMedia = json['social_media'] != null
        ? new SocialMedia.fromJson(json['social_media'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.toJson();
    }
    return data;
  }
}

class SocialMedia {
  String? x;
  String? snapchat;
  String? tiktok;
  String? youtube;
  String? facebook;
  String? email;
  String? phone;

  SocialMedia(
      {this.x,
        this.snapchat,
        this.tiktok,
        this.youtube,
        this.facebook,
        this.email,
        this.phone});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    snapchat = json['snapchat'];
    tiktok = json['tiktok'];
    youtube = json['youtube'];
    facebook = json['facebook'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['snapchat'] = this.snapchat;
    data['tiktok'] = this.tiktok;
    data['youtube'] = this.youtube;
    data['facebook'] = this.facebook;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}