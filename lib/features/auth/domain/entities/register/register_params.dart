import 'dart:io';

import 'package:drug_flow/core/constants/images.dart';

class RegisterParams {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  int? termsAccepted;
  int? governorateId;
  int? cityId;
  int? areaId;
  String? address;
  File? image;

  RegisterParams({this.name, this.email, this.phone, this.password,
    this.passwordConfirmation, this.termsAccepted, this.governorateId,
    this.cityId, this.areaId, this.address,this.image});


  Map<String,dynamic>toMap(){
    return {
      "name" : name,
      "email" : email,
      "phone" :phone,
      "password" :password,
      "password_confirmation" :passwordConfirmation,
      "terms_accepted" :termsAccepted,
      "governorate_id" : governorateId,
      "city_id" : cityId,
      "area_id" : areaId,
      "address" : address,
    };
  }


}