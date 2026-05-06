class CouponsResponse {
  bool? success;
  String? message;
  List<Data>? data;

  CouponsResponse({this.success, this.message, this.data});

  CouponsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic name;
  dynamic code;
  dynamic discountType;
  dynamic discountValue;
  dynamic percentageValue;
  dynamic minOrderAmount;
  dynamic startDate;
  dynamic endDate;
  dynamic usageLimit;
  dynamic usedCount;
  dynamic isActive;
  dynamic createdAt;
dynamic updatedAt;

  Data(
      {this.id,
        this.name,
        this.code,
        this.discountType,
        this.discountValue,
        this.percentageValue,
        this.minOrderAmount,
        this.startDate,
        this.endDate,
        this.usageLimit,
        this.usedCount,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    percentageValue = json['percentage_value'];
    minOrderAmount = json['min_order_amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    usageLimit = json['usage_limit'];
    usedCount = json['used_count'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['discount_type'] = discountType;
    data['discount_value'] = discountValue;
    data['percentage_value'] = percentageValue;
    data['min_order_amount'] = minOrderAmount;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['usage_limit'] = usageLimit;
    data['used_count'] = usedCount;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}