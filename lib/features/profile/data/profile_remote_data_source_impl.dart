import 'package:drug_flow/core/utils/api_base_helper.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact_us_params.dart';
import 'package:drug_flow/features/profile/domain/entities/fqa.dart';
import 'package:drug_flow/features/profile/domain/entities/social_links_response.dart';

import '../../../core/errors/exceptions.dart';
import 'package:dio/dio.dart';

const contactUsApi = "/contact";
const socialLinksApi = "/social-links";
const faqsApi = "/faqs";
const couponsApi = "/coupons";

abstract class ProfileRemoteDataSource {
  Future<ContactUsResponse> contact({ContactUsParams params});
  Future<CouponsResponse> getCoupons();
  Future<FqaResponse> getFqa();
  Future<SocialLinksResponse> getSocialLinks();
}
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final ApiBaseHelper helper;


  ProfileRemoteDataSourceImpl(this.helper);

  @override
  Future<ContactUsResponse> contact({ContactUsParams? params}) async{
    try {
      final formData = FormData.fromMap({
        ...params!.toMap()
      });
      final response = await helper.post(url: contactUsApi, formData: formData);
      return ContactUsResponse.fromJson(response);
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
  Future<FqaResponse> getFqa() async{
    try {
      final response = await helper.get(url: faqsApi);
      return FqaResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<SocialLinksResponse> getSocialLinks()async {
    try {
      final response = await helper.get(url: socialLinksApi);
      return SocialLinksResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }
}