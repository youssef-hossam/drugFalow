import 'package:drug_flow/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact_us_params.dart';
import 'package:drug_flow/features/profile/domain/entities/fqa.dart';
import 'package:drug_flow/features/profile/domain/entities/social_links_response.dart';
abstract class ProfileRepositories {
  Future<Either<Failure,FqaResponse>>getFqa();
  Future<Either<Failure,ContactUsResponse>>contact({ContactUsParams? params});
  Future<Either<Failure,CouponsResponse>> getCoupons();
  Future<Either<Failure,SocialLinksResponse>> getSocialLinks();
}