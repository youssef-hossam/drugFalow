class ApplyCouponParams {
  String? couponCode;

  ApplyCouponParams({this.couponCode});

  Map<String,dynamic>toMap(){
    return {
      "coupon_code" : couponCode
    };
  }
}