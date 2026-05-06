import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/profile/data/profile_remote_data_source_impl.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact_us_params.dart';
import 'package:drug_flow/features/profile/domain/entities/fqa.dart';
import 'package:drug_flow/features/profile/domain/entities/social_links_response.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';

import '../../../core/errors/exceptions.dart';

class ProfileRepositoryImpl implements ProfileRepositories{
  final ProfileRemoteDataSource profileRemoteDataSource;


  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ContactUsResponse>> contact({ContactUsParams? params})async {
    try{
      final response = await profileRemoteDataSource.contact(params: params!);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CouponsResponse>> getCoupons() async{
    try{
      final response = await profileRemoteDataSource.getCoupons();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FqaResponse>> getFqa()async {
    try{
      final response = await profileRemoteDataSource.getFqa();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, SocialLinksResponse>> getSocialLinks() async{
    try{
      final response = await profileRemoteDataSource.getSocialLinks();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }
}