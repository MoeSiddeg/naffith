class ReportResponseBody {
  bool? success;
  String? message;
  Data? data;

  ReportResponseBody({this.success, this.message, this.data});

  ReportResponseBody.fromJson(Map<String, dynamic> json) {
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
  String? realEstateId;
  int? agentId;
  String? type;
  String? text;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.realEstateId,
        this.agentId,
        this.type,
        this.text,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    realEstateId = json['real_estate_id'];
    agentId = json['agent_id'];
    type = json['type'];
    text = json['text'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['real_estate_id'] = this.realEstateId;
    data['agent_id'] = this.agentId;
    data['type'] = this.type;
    data['text'] = this.text;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}