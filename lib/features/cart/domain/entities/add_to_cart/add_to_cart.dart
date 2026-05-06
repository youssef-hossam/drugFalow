class AddToCart {
  bool? success;
  String? message;
  dynamic data;

  AddToCart({this.success, this.message, this.data});

  AddToCart.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
   /* if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
        data!.add(new Null.fromJson(v));
      });
    }*/
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