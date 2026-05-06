class WareHouseDetailsResponse {
  bool? success;
  String? message;
  Data? data;

  WareHouseDetailsResponse({this.success, this.message, this.data});

  WareHouseDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  String? warehouseCode;
  String? name;
  String? logo;
  String? phone;
  String? email;
  String? deliverySupervisorPhone;
  List<String>? workingDays;
  String? deliveryTimes;
  String? minimumPurchase;
  List<Governorates>? governorates;
  List<Cities>? cities;
  List<Areas>? areas;
  List<Products>? products;

  Data(
      {this.id,
        this.warehouseCode,
        this.name,
        this.logo,
        this.phone,
        this.email,
        this.deliverySupervisorPhone,
        this.workingDays,
        this.deliveryTimes,
        this.minimumPurchase,
        this.governorates,
        this.cities,
        this.areas,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warehouseCode = json['warehouse_code'];
    name = json['name'];
    logo = json['logo'];
    phone = json['phone'];
    email = json['email'];
    deliverySupervisorPhone = json['delivery_supervisor_phone'];
    workingDays = json['working_days'].cast<String>();
    deliveryTimes = json['delivery_times'];
    minimumPurchase = json['minimum_purchase'];
    if (json['governorates'] != null) {
      governorates = <Governorates>[];
      json['governorates'].forEach((v) {
        governorates!.add(new Governorates.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['warehouse_code'] = warehouseCode;
    data['name'] = name;
    data['logo'] = logo;
    data['phone'] = phone;
    data['email'] = email;
    data['delivery_supervisor_phone'] = deliverySupervisorPhone;
    data['working_days'] = workingDays;
    data['delivery_times'] = deliveryTimes;
    data['minimum_purchase'] = minimumPurchase;
    if (governorates != null) {
      data['governorates'] = governorates!.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    if (areas != null) {
      data['areas'] = areas!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Governorates {
  int? id;
  String? name;

  Governorates({this.id, this.name});

  Governorates.fromJson(Map<String, dynamic> json) {
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

class Areas {
  int? id;
  String? name;
  int? cityId;

  Areas({this.id, this.name, this.cityId});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  String? price;
  String? category;
  List<ActiveIngredients>? activeIngredients;
  Warehouse? warehouse;

  Products(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.category,
        this.activeIngredients,
        this.warehouse});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    category = json['category'];
    if (json['active_ingredients'] != null) {
      activeIngredients = <ActiveIngredients>[];
      json['active_ingredients'].forEach((v) {
        activeIngredients!.add(ActiveIngredients.fromJson(v));
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
class Cities {
  dynamic id;
  dynamic name;

  Cities ({this.id, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
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