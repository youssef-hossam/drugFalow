class ContactUsResponse {
  bool? success;
  String? message;
  Data? data;

  ContactUsResponse({this.success, this.message, this.data});

  ContactUsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic name;
  dynamic email;
  dynamic message;
  dynamic createdAt;
  dynamic readAt;
  dynamic status;

  Data(
      {this.id,
        this.name,
        this.email,
        this.message,
        this.createdAt,
        this.readAt,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    message = json['message'];
    createdAt = json['created_at'];
    readAt = json['read_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['read_at'] = readAt;
    data['status'] = status;
    return data;
  }
}