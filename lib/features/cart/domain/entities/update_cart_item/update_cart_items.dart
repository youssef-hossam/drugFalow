class UpdateCartItem {
  bool? success;
  String? message;
  Data? data;

  UpdateCartItem({this.success, this.message, this.data});

  UpdateCartItem.fromJson(Map<String, dynamic> json) {
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
  Warehouse? warehouse;
  Product? product;
  dynamic quantity;
  dynamic totalPrice;

  Data({this.id, this.warehouse, this.product, this.quantity, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    return data;
  }
}

class Warehouse {
  int? id;
  dynamic name;
  dynamic logo;

  Warehouse({this.id, this.name, this.logo});

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class Product {
  int? id;
  dynamic name;
  dynamic image;
  dynamic price;
  List<ActiveIngredients>? activeIngredients;

  Product({this.id, this.name, this.image, this.price, this.activeIngredients});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    if (json['active_ingredients'] != null) {
      activeIngredients = <ActiveIngredients>[];
      json['active_ingredients'].forEach((v) {
        activeIngredients!.add(new ActiveIngredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    if (activeIngredients != null) {
      data['active_ingredients'] =
          activeIngredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveIngredients {
  dynamic id;
  dynamic name;

  ActiveIngredients({this.id, this.name});

  ActiveIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}