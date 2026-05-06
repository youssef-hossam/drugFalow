import 'package:drug_flow/core/utils/api_base_helper.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/home/domain/entities/sliders_response.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_details_response.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_params.dart';

import '../../../core/errors/exceptions.dart';
import '../domain/entities/ware_house/ware_house_response.dart';

const slidersApi = "/sliders";
const couponsApi = "/coupons";
const warehousesApi = "/warehouses";
const warehousesDetailsApi = "/warehouses/";

abstract class HomeRemoteDataSource{
  Future<SlidersResponse>getSliders();
  Future<CouponsResponse>getCoupons();
  Future<WareHouseResponse>getWhareHouse();
  Future<WareHouseDetailsResponse>getWhareHouseDetails({WareHouseParams params});
}
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final ApiBaseHelper helper;

  HomeRemoteDataSourceImpl(this.helper);

  @override
  Future<SlidersResponse> getSliders() async{
    try {
      final response = await helper.get(url: slidersApi,);
      return SlidersResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<CouponsResponse> getCoupons() async{
    try {
      final response = await helper.get(url: couponsApi,);
      return CouponsResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<WareHouseResponse> getWhareHouse() async{
    try {
      final response = await helper.get(url: warehousesApi,);
      return WareHouseResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<WareHouseDetailsResponse> getWhareHouseDetails({WareHouseParams? params})async {
    try {
      final response = await helper.get(url: '$warehousesDetailsApi${params!.warehouseId}',);
      return WareHouseDetailsResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }
}