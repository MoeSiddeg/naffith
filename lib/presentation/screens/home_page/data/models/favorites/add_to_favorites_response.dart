class AddToFavoritesResponse {
  bool? success;
  String? message;
  List<dynamic>? data; // Change the type to dynamic or the actual type you expect

  AddToFavoritesResponse({this.success, this.message, this.data});

  AddToFavoritesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data']; // Assign directly, as it's an empty list in the response
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data; // Assign directly
    return data;
  }
}
