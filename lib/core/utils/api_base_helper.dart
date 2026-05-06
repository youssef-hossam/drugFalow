import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/options.dart';
import 'package:flutter/cupertino.dart';
import '../constants/endPoints.dart';
import '../errors/exceptions.dart';
import 'auth_interceptor.dart';

class ApiBaseHelper {
  final dio = Dio();
  Map<String, String> headers = {
    "Accept": "application/json",
    'lang': 'ar'
  };
  void updateLocalHeader(String locale){
    headers["lang"] = locale;
    dio.options.headers = headers;
  }

  void dioInit(){
    final options = BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (_) =>  true,
      connectTimeout: Duration(milliseconds: 40000),
      responseType: ResponseType.json,
      sendTimeout: Duration(milliseconds: 40000),
      receiveTimeout: Duration(milliseconds: 40000),
      receiveDataWhenStatusError: true,);
    dio.options = options;
    dio.options.headers = headers;
    dio.httpClientAdapter = HttpClientAdapter();
    dio.interceptors.add(AuthInterceptor());
  }

  Future<dynamic>post({required String url,
  /*  required Map<String,dynamic>body*/String? token,required FormData? formData})async{

   // FormData formData = FormData.fromMap(body);
    try{
      Response response = await dio.post(url,data: formData,);
      return _returnResponseJson(response);
    }on DioException catch(e){
      print(e.error.toString());
      throw ServerException(
          message: e.response!.data != null
              ? e.response!.data["error"].toString() ?? "Something went wrong"
              : "Something went wrong");
    }on SocketException {
      throw ServerException(message: "No internet, please try again later");
    }on IOException catch(e){
      throw ServerException(message: e.toString());
    }


  }
  Future<dynamic>put({required String url,
    required Map<String,dynamic>body,String? token,})async{

    FormData formData = FormData.fromMap(body);
    try{
      Response response = await dio.put(url,data: formData,);
      return _returnResponseJson(response);
    }on DioException catch(e){
      print(e.error.toString());
      throw ServerException(
          message: e.response!.data != null
              ? e.response!.data["error"].toString() ?? "Something went wrong"
              : "Something went wrong");
    }on SocketException {
      throw ServerException(message: "No internet, please try again later");
    }on IOException catch(e){
      throw ServerException(message: e.toString());
    }


  }

  Future<dynamic>get({required String url,String? token,Map<String,dynamic>? query})async{
    try{
      dio.interceptors.add(AuthInterceptor());
      Response response = await dio.get(url,queryParameters: query);
      return _returnResponseJson(response);
    }on DioException catch(e){
      throw ServerException(
          message: e.response!.data != null
              ? e.response!.data["error"].toString() ?? "Something went wrong"
              : "Something went wrong");
    }on SocketException {
      throw ServerException(message: "No internet, please try again later");
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    try {
      dio.interceptors.add(AuthInterceptor());
      debugPrint("url => $url");
      final Response response = await dio.delete(url);
      return _returnResponseJson(response);

    } on DioException catch (e) {

      throw ServerException(
          message: e.response != null
              ? e.response!.data["msg"] ?? "Something Went Wrong"
              : " Something went wrong");
    } on SocketException {
      throw ServerException(message: "No internet please try again later");
    }
  }

  dynamic _returnResponseJson(Response response) {
    final data = _safeData(response.data);
    switch (response.statusCode) {
      case 200:
        return data;
      case 201:
        return data;
      case 400:
        throw ServerException(message: data["message"]);
      case 422:
        throw UnprocessableContentException(message: data["message"] );
      case 429:
        throw UnprocessableContentException(message: data["message"] );
      case 401:
        throw UnAuthorizedException(message: data["message"]);
      case 403:
        throw data["message"];
      case 404:
        throw NotFoundException(message: data["message"]);
      case 500:
        throw ServerException(
            message:
            'Error occurred while Communication with Server with StatusCode :'
                ' ${response.statusCode} $data');
      default:
        debugPrint(
            "Error occurred while Communication with Server with StatusCode : "
                "${response.statusCode} $data");
        throw ServerException(
            message:
            "Error occurred while Communication with Server with StatusCode : "
                "${response.statusCode} $data");
    }
  }
  dynamic _safeData(dynamic data) {
    if (data == null) return null;

    // already decoded JSON
    if (data is Map<String, dynamic>) return data;

    // JSON string
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        return decoded is String ? jsonDecode(decoded) : decoded;
      } catch (e) {
        return {"message": data}; // fallback for HTML/text
      }
    }

    return data;
  }
}
