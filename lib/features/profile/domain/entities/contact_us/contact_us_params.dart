class ContactUsParams {
  String? name;
  String? phone;
  String? message;
  String? email;

  ContactUsParams({this.name, this.phone, this.message, this.email});


  Map<String,dynamic>toMap(){
    return {
      "name" : name,
      "phone" :phone,
      "email" : email,
      "message" : message
    };
  }
}