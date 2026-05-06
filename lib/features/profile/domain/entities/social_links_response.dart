class SocialLinksResponse {
  bool? success;
  String? message;
  Data? data;

  SocialLinksResponse({this.success, this.message, this.data});

  SocialLinksResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;
  dynamic linkedin;
  dynamic youtube;
  dynamic whatsapp;
  dynamic headerLogo;

  Data(
      {this.facebook,
        this.instagram,
        this.twitter,
        this.linkedin,
        this.youtube,
        this.whatsapp,
        this.headerLogo});

  Data.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    whatsapp = json['whatsapp'];
    headerLogo = json['header_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    data['youtube'] = youtube;
    data['whatsapp'] = whatsapp;
    data['header_logo'] = headerLogo;
    return data;
  }
}