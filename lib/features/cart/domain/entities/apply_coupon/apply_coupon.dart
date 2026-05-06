class ApplyCouponResponse {
  bool? success;
  String? message;
  Data? data;

  ApplyCouponResponse({this.success, this.message, this.data});

  ApplyCouponResponse.fromJson(Map<String, dynamic> json) {
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
  Coupon? coupon;
  CartSummary? cartSummary;

  Data({this.coupon, this.cartSummary});

  Data.fromJson(Map<String, dynamic> json) {
    coupon =
    json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
    cartSummary = json['cart_summary'] != null
        ? new CartSummary.fromJson(json['cart_summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (cartSummary != null) {
      data['cart_summary'] = cartSummary!.toJson();
    }
    return data;
  }
}

class Coupon {
  dynamic code;
  dynamic name;
  dynamic discountType;
  dynamic discountAmount;
  dynamic discountDisplay;

  Coupon(
      {this.code,
        this.name,
        this.discountType,
        this.discountAmount,
        this.discountDisplay});

  Coupon.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    discountType = json['discount_type'];
    discountAmount = json['discount_amount'];
    discountDisplay = json['discount_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['discount_type'] = discountType;
    data['discount_amount'] = discountAmount;
    data['discount_display'] = discountDisplay;
    return data;
  }
}

class CartSummary {
  dynamic subTotal;
  dynamic discount;
  dynamic totalAfterDiscount;

  CartSummary({this.subTotal, this.discount, this.totalAfterDiscount});

  CartSummary.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    discount = json['discount'];
    totalAfterDiscount = json['total_after_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['discount'] = discount;
    data['total_after_discount'] = totalAfterDiscount;
    return data;
  }
}