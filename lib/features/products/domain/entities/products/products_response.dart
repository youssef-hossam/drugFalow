class ProductsResponse {
  bool? success;
  String? message;
  Data? data;

  ProductsResponse({this.success, this.message, this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Items>? items;
  Meta? meta;

  Data({this.items, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  dynamic name;
  dynamic image;
  dynamic price;
  dynamic category;
  List<ActiveIngredients>? activeIngredients;
  Warehouse? warehouse;

  Items(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.category,
        this.activeIngredients,
        this.warehouse});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    category = json['category'];
    if (json['active_ingredients'] != null) {
      activeIngredients = <ActiveIngredients>[];
      json['active_ingredients'].forEach((v) {
        activeIngredients!.add(new ActiveIngredients.fromJson(v));
      });
    }
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['category'] = category;
    if (activeIngredients != null) {
      data['active_ingredients'] =
          activeIngredients!.map((v) => v.toJson()).toList();
    }
    if (warehouse != null) {
      data['warehouse'] = warehouse!.toJson();
    }
    return data;
  }
}

class ActiveIngredients {
  int? id;
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

class Meta {
  dynamic currentPage;
  dynamic lastPage;
  dynamic perPage;
  dynamic total;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  Meta(
      {this.currentPage,
        this.lastPage,
        this.perPage,
        this.total,
        this.nextPageUrl,
        this.prevPageUrl});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['total'] = total;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    return data;
  }
}