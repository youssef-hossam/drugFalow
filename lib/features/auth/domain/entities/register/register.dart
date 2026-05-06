class RegisterResponse {
  bool? success;
  String? message;
  Data? data;

  RegisterResponse({this.success, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  Name? name;
  dynamic email;
  dynamic phone;
  dynamic governorateId;
  dynamic cityId;
  dynamic areaId;
  Name? address;
  bool? isVerified;
  dynamic pharmacyCode;
  dynamic updatedAt;
  dynamic createdAt;
  int? id;

  User(
      {this.name,
        this.email,
        this.phone,
        this.governorateId,
        this.cityId,
        this.areaId,
        this.address,
        this.isVerified,
        this.pharmacyCode,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    phone = json['phone'];
    governorateId = json['governorate_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    address =
    json['address'] != null ? new Name.fromJson(json['address']) : null;
    isVerified = json['is_verified'];
    pharmacyCode = json['pharmacy_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['email'] = email;
    data['phone'] = phone;
    data['governorate_id'] = governorateId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['is_verified'] = isVerified;
    data['pharmacy_code'] = pharmacyCode;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class Name {
  dynamic en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}