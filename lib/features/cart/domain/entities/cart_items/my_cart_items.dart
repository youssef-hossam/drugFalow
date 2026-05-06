class MyCartItems {
  bool? success;
  String? message;
  Data? data;

  MyCartItems({this.success, this.message, this.data});

  MyCartItems.fromJson(Map<String, dynamic> json) {
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
  List<CartItems>? cartItems;
  int? subTotal;

  Data({this.cartItems, this.subTotal});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['sub_total'] = subTotal;
    return data;
  }
}

class CartItems {
  int? id;
  Warehouse? warehouse;
  Product? product;
  int? quantity;
  int? totalPrice;

  CartItems(
      {this.id, this.warehouse, this.product, this.quantity, this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? logo;

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
  String? name;
  String? image;
  String? price;
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
  int? id;
  String? name;

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