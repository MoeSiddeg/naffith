class UploadFaalResponseBody {
  bool? success;
  String? message;
  Data? data;

  UploadFaalResponseBody({this.success, this.message, this.data});

  UploadFaalResponseBody.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? faalDocument;

  Data({this.id, this.faalDocument});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    faalDocument = json['faal_document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['faal_document'] = this.faalDocument;
    return data;
  }
}